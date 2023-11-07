page 50103 Makes
{
    ApplicationArea = All;
    Caption = 'Makes';
    PageType = List;
    SourceTable = make;
    UsageCategory = Lists;

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
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Models)
            {
                RunObject = page "Make Models";
                RunPageLink = Make = field(Code);
            }

        }
    }
}
