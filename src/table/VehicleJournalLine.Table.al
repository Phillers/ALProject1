table 50105 "Vehicle Journal Line"
{
    Caption = 'Vehicle Journal Line';
    DataClassification = CustomerContent;
    LookupPageId = "Vehicle Journal";

    fields
    {
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(11; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            TableRelation = Vehicle;
        }
        field(12; "Operation Date"; Date)
        {
            Caption = 'Operation Date';
        }
        field(13; "Operation Type"; Enum "Vehicle Operation Type")
        {
            Caption = 'Operation Type';
        }
        field(14; "Duration (h)"; Decimal)
        {
            Caption = 'Duration (h)';
        }
        field(15; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            TableRelation = Resource;
        }
        field(16; Description; Text[100])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }


    procedure Register()
    begin
        Register(false);
    end;

    procedure Register(HideDialog: Boolean)
    var
        VehicleJournalRegister: Codeunit "Vehicle Journal-Register";
    begin
        VehicleJournalRegister.Register(Rec, HideDialog);
    end;
}
