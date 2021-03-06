codeunit 50104 "Enable TV Application Area"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Application Area Mgmt.", 'OnGetEssentialExperienceAppAreas', '', false, false)]
    local procedure OnGetEssentialExperienceAppAreas(var TempApplicationAreaSetup: Record "Application Area Setup" temporary)
    begin
        TempApplicationAreaSetup."Television Shows" := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Application Area Mgmt.", 'OnValidateApplicationAreas', '', false, false)]
    local procedure OnValidateApplicationAreas(ExperienceTierSetup: Record "Experience Tier Setup"; TempApplicationAreaSetup: Record "Application Area Setup" temporary)
    var
        InvalidErrL: Label 'Television Shows should be part of Essential in order for the application to work.';
    begin
        if ExperienceTierSetup.Essential then
            if not TempApplicationAreaSetup."Television Shows" then
                Error(InvalidErrL);
    end;

    procedure IsTelevisionShowsEnabled(): Boolean
    var
        AppAreaSetupL: Record "Application Area Setup";
        AppAreaMgmtFacadeL: Codeunit "Application Area Mgmt. Facade";
    begin
        if AppAreaMgmtFacadeL.GetApplicationAreaSetupRecFromCompany(AppAreaSetupL, CompanyName()) then
            exit(AppAreaSetupL."Television Shows");
    end;

    procedure EnableTelevisionShows()
    var
        AppAreaSetup: Record "Application Area Setup";
        ExperienceTierSetup: Record "Experience Tier Setup";
        AppAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        if ExperienceTierSetup.Get(CompanyName()) then;
        if not ExperienceTierSetup.Essential then
            exit;
        if AppAreaMgmtFacade.GetApplicationAreaSetupRecFromCompany(AppAreaSetup, CompanyName()) then begin
            AppAreaSetup."Television Shows" := true;
            AppAreaSetup.Modify();
            AppAreaMgmtFacade.SetupApplicationArea();
        end;
    end;
}