page 50108 "Transport Order Subform"
{
    ApplicationArea = All;
    Caption = 'Transport Order Subform';
    PageType = ListPart;
    SourceTable = "Transport Order Line";
    AutoSplitKey = true;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Starting POI"; Rec."Starting POI")
                {
                    ToolTip = 'Specifies the value of the Starting POI field.';
                }
                field("Starting Time"; Rec."Starting Time")
                {
                    ToolTip = 'Specifies the value of the Starting Time field.';
                }
                field("Ending POI"; Rec."Ending POI")
                {
                    ToolTip = 'Specifies the value of the Ending POI field.';
                }
                field("Ending Time"; Rec."Ending Time")
                {
                    ToolTip = 'Specifies the value of the Ending Time field.';
                }
            }
        }
    }
}
