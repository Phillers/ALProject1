page 50105 "Vehicle Manager"
{
    ApplicationArea = All;
    Caption = 'Vehicle Manager';
    PageType = RoleCenter;

    layout
    {
    }
    actions
    {
        area(Embedding)
        {
            action("Vehicle List")
            {
                ApplicationArea = All;
                RunObject = page "Vehicle List";
                Caption = 'Vehicle List';
            }
            action("Vehicle Journal")
            {
                ApplicationArea = All;
                RunObject = page "Vehicle Journal";
            }
        }

        area(Sections)
        {
            group(Administration)
            {
                Caption = 'Administration';
                action("Makes")
                {
                    ApplicationArea = All;
                    RunObject = page Makes;
                    Caption = 'Makes';
                }
                action("Make Models")
                {
                    ApplicationArea = All;
                    RunObject = page "Make Models";
                    Caption = 'Make Models';
                }
                action("Vehicle Management Setup")
                {
                    ApplicationArea = All;
                    RunObject = page "Vehicle Management Setup";
                    Caption = 'Vehicle Management Setup';
                }
            }
            group(History)
            {
                action("Vehicle Entries")
                {
                    ApplicationArea = All;
                    RunObject = page "Vehicle Entries";
                }
            }

        }

    }
}
