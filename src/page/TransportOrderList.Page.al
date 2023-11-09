page 50110 "Transport Order List"
{
    ApplicationArea = All;
    Caption = 'Transport Order List';
    PageType = List;
    SourceTable = "Transport Order Header";
    UsageCategory = Documents;
    Editable = false;
    CardPageId = "Transport Order";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Driver No."; Rec."Driver No.")
                {
                    ToolTip = 'Specifies the value of the Driver No. field.';
                }
                field("Transporter No."; Rec."Transporter No.")
                {
                    ToolTip = 'Specifies the value of the Transporter No. field.';
                }
            }
        }
    }
}
