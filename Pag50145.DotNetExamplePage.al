page 50145 "DotNet Example Page"
{
    PageType = ListPlus;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            group(Group)
            {
                field(Number; NumberL)
                {
                    Caption = 'Enter the base number:';
                    ApplicationArea = All;
                }
                field(Power; PowerL)
                {
                    Caption = 'Enter the power to be applied:';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Caption = 'Calculate power';

                trigger OnAction()
                var
                    MessageTxtL: Label '%1 to the power of %2 is %3';
                begin
                    Message(MessageTxtL, NumberL, PowerL, CalculatePowerOfNumber(NumberL, PowerL));
                end;
            }
        }
    }

    var
        NumberL: Decimal;
        PowerL: Decimal;

    local procedure CalculatePowerOfNumber(Number: Decimal; Power: Decimal): Decimal
    var
        MathL: DotNet MyMathLib;
    begin
        exit(MathL.Pow(Number, Power));
    end;
}