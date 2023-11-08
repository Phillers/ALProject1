page 50104 "Make Models"
{
    ApplicationArea = All;
    Caption = 'Make Models';
    PageType = List;
    SourceTable = "Make Model";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Make; Rec.Make)
                {
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.';
                }
            }
        }
    }
}
