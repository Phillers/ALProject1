page 50107 "Vehicle Journal"
{
    ApplicationArea = All;
    Caption = 'Vehicle Journal';
    PageType = Worksheet;
    SourceTable = "Vehicle Journal Line";
    UsageCategory = Tasks;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
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
    actions
    {
        area(Processing)
        {
            action(Register)
            {
                ApplicationArea = All;
                Promoted = true;
                ToolTip = 'Executes the Register action.';
                Caption = 'Register';
                Image = ViewRegisteredOrder;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Register();
                    CurrPage.Update(false);
                end;
            }
            action("Register(No dialog)")
            {
                ApplicationArea = All;
                Promoted = true;
                ToolTip = 'Executes the Register action.';
                Caption = 'Register(No dialog)';
                Image = Registered;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Register(true);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
