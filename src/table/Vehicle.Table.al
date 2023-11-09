table 50101 Vehicle
{
    Caption = 'Vehicle';
    DataClassification = CustomerContent;
    LookupPageId = "Vehicle List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            begin
                TestNoSeries();
            end;


        }
        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(12; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(13; Make; Code[20])
        {
            Caption = 'Make';
            TableRelation = Make;
        }
        field(14; Model; Code[20])
        {
            Caption = 'Model';
            TableRelation = "Make Model".Model where(Make = field(Make));
        }
        field(15; Year; Code[10])
        {
            Caption = 'Year';
        }
        field(16; VIN; Code[20])
        {
            Caption = 'VIN';
        }
        field(17; Status; Enum "Vehicle Status")
        {
            DataClassification = ToBeClassified;
        }
        field(18; Name; Text[50])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "No." = '' then begin
            VehicleManagementSetup.Get();
            VehicleManagementSetup.TestField("Vehicle Nos.");
            NoSeriesManagement.InitSeries(VehicleManagementSetup."Vehicle Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        VehicleManagementSetup: Record "Vehicle Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    local procedure TestNoSeries()
    var
        Vehicle: Record Vehicle;
    begin

        if "No." <> xRec."No." then
            if not Vehicle.Get(Rec."No.") then begin
                VehicleManagementSetup.Get();
                NoSeriesManagement.TestManual(VehicleManagementSetup."Vehicle Nos.");
                "No. Series" := '';
            end;
    end;

    procedure AssistEdit(OldVehicle: Record Vehicle): Boolean
    var
        Vehicle: Record Vehicle;
    begin
        Vehicle := Rec;
        VehicleManagementSetup.Get();
        VehicleManagementSetup.TestField("Vehicle Nos.");
        if NoSeriesManagement.SelectSeries(VehicleManagementSetup."Vehicle Nos.", OldVehicle."No. Series", Vehicle."No. Series") then begin
            NoSeriesManagement.SetSeries(Vehicle."No.");
            Rec := Vehicle;
            exit(true);
        end;
    end;

}
