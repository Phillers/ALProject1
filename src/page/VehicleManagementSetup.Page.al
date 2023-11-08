page 50100 "Vehicle Management Setup"
{
    ApplicationArea = All;
    Caption = 'Vehicle Management Setup';
    PageType = Card;
    SourceTable = "Vehicle Management Setup";
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

            }
            group("No. Series")
            {
                Caption = 'No. Series';

                field("Vehicle Nos."; Rec."Vehicle Nos.")
                {
                    ToolTip = 'Specifies the value of the Vehicle Nos. field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
