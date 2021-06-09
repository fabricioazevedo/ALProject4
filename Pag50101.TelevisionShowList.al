page 50101 "Television Show List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Television Show Card";
    SourceTable = "Television Show";
    HelpLink = 'http://customhelpsite.com/televisionshows';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    StyleExpr = 'attention';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(test)
            {
                ApplicationArea = All;

                trigger OnAction()

                var
                    TelevisionShowSetupNameTxt: Label '_Television Show Setup';
                    TelevisionShowSetupDescriptionTxt: Label '_Set up television show application.';
                    KeyWordsTxt: Label '_television, show, tv, setup';
                    codeunitL: Codeunit "manual setup";
                    setuppageL: Page "Television Show Setup Card";
                    enumL: Enum "Manual Setup Category";
                begin
                    codeunitL.Insert(TelevisionShowSetupNameTxt, TelevisionShowSetupDescriptionTxt, KeyWordsTxt, Page::"Television Show Setup Card", getappid(), "Manual Setup Category"::Finance);
                end;
            }
            action(test2)
            {
                trigger OnAction()
                var
                    Info: ModuleInfo;
                    EmptyGuid: Guid;
                begin
                    if Info.Id() = EmptyGuid then
                        NavApp.GetCurrentModuleInfo(Info);
                    Message(info.Id);
                end;
            }
        }
    }
    local procedure GetAppId(): Guid
    var
        EmptyGuid: Guid;
        info: ModuleInfo;
    begin
        if Info.Id() = EmptyGuid then
            NavApp.GetCurrentModuleInfo(Info);

        exit(Info.Id());
    end;
}