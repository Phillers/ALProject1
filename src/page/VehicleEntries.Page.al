page 50106 "Vehicle Entries"
{
    ApplicationArea = All;
    Caption = 'Vehicle Entries';
    PageType = List;
    SourceTable = "Vehicle Entry";
    UsageCategory = History;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Operation Date"; Rec."Operation Date")
                {
                    ToolTip = 'Specifies the value of the Operation Date field.';
                }
                field("Operation Type"; Rec."Operation Type")
                {
                    ToolTip = 'Specifies the value of the Operation Type field.';
                }
                field("Duration (h)"; Rec."Duration (h)")
                {
                    ToolTip = 'Specifies the value of the Duration (h) field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
