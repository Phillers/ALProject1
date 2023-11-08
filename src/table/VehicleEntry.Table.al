table 50104 "Vehicle Entry"
{
    Caption = 'Vehicle Entry';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
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
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    internal procedure CopyFromJournal(var VehicleJournalLine: Record "Vehicle Journal Line")
    begin
        "Vehicle No." := VehicleJournalLine."Vehicle No.";
        "Duration (h)" := VehicleJournalLine."Duration (h)";
        "Operation Date" := VehicleJournalLine."Operation Date";
        "Operation Type" := VehicleJournalLine."Operation Type";
        "Resource No." := VehicleJournalLine."Resource No.";
        Description := VehicleJournalLine.Description;
    end;
}
