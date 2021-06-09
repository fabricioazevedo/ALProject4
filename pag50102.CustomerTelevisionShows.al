page 50102 "Customer Television Shows"
{
    PageType = List;
    SourceTable = "Customer Television Show";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Television Show Code"; Rec."Television Show Code")
                {
                    ApplicationArea = All;
                }
                field(Favorite; Rec.Favorite)
                {
                    ApplicationArea = All;
                }
                field(Customer; rec."Customer No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}