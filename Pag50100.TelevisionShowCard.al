page 50100 "Television Show Card"
{
    PageType = Card;
    SourceTable = "Television Show";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';

                }
                field(Synopsis; Rec.Synopsis)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("First Aired"; Rec."First Aired")
                {
                    ApplicationArea = All;
                }
                field("Last Aired"; Rec."Last Aired")
                {
                    ApplicationArea = All;
                }
                field("TVMaze ID"; Rec."TVMaze ID")
                {
                    ToolTip = 'Specifies the value of the TVMaze ID field';
                    ApplicationArea = All;
                    StyleExpr = textColorG;
                    trigger OnValidate()
                    begin
                        if Rec."TVMaze ID" < xRec."TVMaze ID" then
                            textColorG := 'unfavorable'
                        else
                            if Rec."TVMaze ID" > xRec."TVMaze ID" then
                                textColorG := 'favorable'
                    end;
                }
            }
        }
    }
    var
        textColorG: Text;

    trigger OnOpenPage()
    begin
        textColorG := 'ambiguous'
    end;
}