table 50108 "Transport Order Line"
{
    Caption = 'Transport Order Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Tranport Order No."; Code[20])
        {
            Caption = 'Tranport Order No.';
            TableRelation = "Transport Order Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(11; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            TableRelation = Vehicle;
        }
        field(12; "Starting POI"; Code[20])
        {
            Caption = 'Starting POI';
            TableRelation = "Point of Interest";
        }
        field(13; "Starting Time"; DateTime)
        {
            Caption = 'Starting Time';
            trigger OnLookup()
            var
                DateTimeDialog: Page "Date-Time Dialog";
            begin
                DateTimeDialog.SetDateTime("Starting Time");
                if DateTimeDialog.RunModal() = Action::OK then
                    "Starting Time" := DateTimeDialog.GetDateTime()
            end;
        }
        field(14; "Ending POI"; Code[20])
        {
            Caption = 'Ending POI';
            TableRelation = "Point of Interest";

        }
        field(15; "Ending Time"; DateTime)
        {
            Caption = 'Ending Time';
            trigger OnLookup()
            var
                DateTimeDialog: Page "Date-Time Dialog";
            begin
                DateTimeDialog.SetDateTime("Ending Time");
                if DateTimeDialog.RunModal() = Action::OK then
                    "Ending Time" := DateTimeDialog.GetDateTime();
            end;
        }
    }
    keys
    {
        key(PK; "Tranport Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
