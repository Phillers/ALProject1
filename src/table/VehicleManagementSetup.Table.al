// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

table 50100 "Vehicle Management Setup"
{
    fields
    {
        field(1; "Primary Key"; code[10])
        {
            DataClassification = CustomerContent;
        }
        field(11; "Vehicle Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(12; "Transport Order Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}