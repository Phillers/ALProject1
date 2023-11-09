page 50111 "Points of Interest"
{
    ApplicationArea = All;
    Caption = 'Points of Interest';
    PageType = List;
    SourceTable = "Point of Interest";
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Name 2"; Rec."Name 2")
                {
                    ToolTip = 'Specifies the value of the Name 2 field.';
                }
            }
        }
    }
}
