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
                Caption = 'Vehicle Journal';
            }
            action("Transport Orders")
            {
                ApplicationArea = All;

                RunObject = page "Transport Order List";
                Caption = 'Transport Orders';
            }
        }

        area(Sections)
        {
            group(Functions)
            {
                Caption = 'Processing';
                action("Vehicle List2")
                {
                    ApplicationArea = All;
                    RunObject = page "Vehicle List";
                    Caption = 'Vehicle List';
                }
                action("Vehicle Journal2")
                {
                    ApplicationArea = All;
                    RunObject = page "Vehicle Journal";
                    Caption = 'Vehicle Journal';
                }
                action("Transport Orders2")
                {
                    ApplicationArea = All;

                    RunObject = page "Transport Order List";
                    Caption = 'Transport Orders';
                }
            }
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
                Caption = 'History';
                action("Vehicle Entries")
                {
                    ApplicationArea = All;
                    RunObject = page "Vehicle Entries";
                    Caption = 'Vehicle Entries';
                }
            }

        }

    }
}
