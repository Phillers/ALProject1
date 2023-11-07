table 50102 Make
{
    Caption = 'Make';
    DataClassification = ToBeClassified;
    LookupPageId = Makes;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
