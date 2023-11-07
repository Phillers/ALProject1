table 50103 "Make Model"
{
    Caption = 'Make Model';
    DataClassification = CustomerContent;
    LookupPageId = "Make Models";
    fields
    {
        field(1; Make; Code[20])
        {
            Caption = 'Make';
        }
        field(2; Model; Code[20])
        {
            Caption = 'Model';
        }
    }
    keys
    {
        key(PK; Make, Model)
        {
            Clustered = true;
        }
    }
}
