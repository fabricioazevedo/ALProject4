codeunit 50105 "Register Manual Setups"
{
    var
        info: ModuleInfo;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"manual Setup", 'OnRegisterManualSetup', '', false, false)]
    local procedure initializeman()
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

    local procedure GetAppId(): Guid
    var
        EmptyGuid: Guid;
    begin
        if Info.Id() = EmptyGuid then
            NavApp.GetCurrentModuleInfo(Info);

        exit(Info.Id());
    end;
}