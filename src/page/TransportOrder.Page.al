page 50109 "Transport Order"
{
    ApplicationArea = All;
    Caption = 'Transport Order';
    PageType = Document;
    SourceTable = "Transport Order Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
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
            part(Lines; "Transport Order Subform")
            {
                SubPageLink = "Tranport Order No." = field("No.");
            }
        }
    }
}
