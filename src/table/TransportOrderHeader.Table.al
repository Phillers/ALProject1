table 50106 "Transport Order Header"
{
    Caption = 'Transport Order Header';
    DataClassification = CustomerContent;

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
            DataClassification = ToBeClassified;
        }
        field(11; "Driver No."; Code[20])
        {
            Caption = 'Driver No.';
            TableRelation = Resource where(Type = const(Person));
        }
        field(12; "Transporter No."; Code[20])
        {
            Caption = 'Transporter No.';
            TableRelation = Resource where(Type = const(Machine));
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
            VehicleManagementSetup.TestField("Transport Order Nos.");
            NoSeriesManagement.InitSeries(VehicleManagementSetup."Transport Order Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        VehicleManagementSetup: Record "Vehicle Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    local procedure TestNoSeries()
    var
        TransportOrderHeader: Record "Transport Order Header";
    begin

        if "No." <> xRec."No." then
            if not TransportOrderHeader.Get(Rec."No.") then begin
                VehicleManagementSetup.Get();
                NoSeriesManagement.TestManual(VehicleManagementSetup."Transport Order Nos.");
                "No. Series" := '';
            end;
    end;

    procedure AssistEdit(OldRec: Record "Transport Order Header"): Boolean
    var
        TransportOrderHeader: Record "Transport Order Header";
    begin
        TransportOrderHeader := Rec;
        VehicleManagementSetup.Get();
        VehicleManagementSetup.TestField("Transport Order Nos.");
        if NoSeriesManagement.SelectSeries(VehicleManagementSetup."Transport Order Nos.", OldRec."No. Series", TransportOrderHeader."No. Series") then begin
            NoSeriesManagement.SetSeries(TransportOrderHeader."No.");
            Rec := TransportOrderHeader;
            exit(true);
        end;
    end;
}
