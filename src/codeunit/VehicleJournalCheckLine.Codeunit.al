codeunit 50102 "Vehicle Journal-Check Line"
{
    TableNo = "Vehicle Journal Line";

    trigger OnRun()
    begin
        Rec.TestField(Description);
        Rec.TestField("Duration (h)");
        Rec.TestField("Line No.");
        Rec.TestField("Operation Date");
        Rec.TestField("Operation Type");
        Rec.TestField("Resource No.");
        Rec.TestField("Vehicle No.");
    end;

}
