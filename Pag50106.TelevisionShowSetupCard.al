page 50106 "Television Show Setup Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Television Show Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {

        }
    }
    actions
    {
        area(Processing)
        {
            action(SetLicense)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    LicenseInputDialog: page "License Input Dialog";
                begin
                    if LicenseInputDialog.RunModal() = Action::OK then
                        SetLicenseInStorage(LicenseInputDialog.GetLicenseText());
                end;
            }
            action(GetLicense)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    GetLicenseFromStorage();
                end;
            }

        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

    local procedure SetLicenseInStorage(LicenseText: Text[10])
    var
        SuccessMsgL: Label 'License successfully stored';
        FailureErrL: Label 'License could not be stored';
        MustNotBeBlankErrL: Label 'You must provide a valid license';
    begin
        if LicenseText <> '' then begin
            DeleteExistingLicense();
            if IsolatedStorage.Set(GetLicenseStorageKey(), LicenseText, DataScope::Module) then
                Message(SuccessMsgL)
            else
                Error(FailureErrL);
        end else
            Error(MustNotBeBlankErrL);
    end;

    local procedure GetLicenseFromStorage()
    var
        SuccessMsgL: Label 'License retrieved: %1';
        FailureErrL: Label 'License could not be retrieved';
        LicenseTextL: Text;
    begin
        if IsolatedStorage.Get(GetLicenseStorageKey(), DataScope::Module, LicenseTextL) then
            Message(SuccessMsgL, LicenseTextL)
        else
            Error(FailureErrL);
    end;

    local procedure DeleteExistingLicense()
    var
        PromptToDeleteMsgL: Label 'There is an existing license stored. Are you sure you want to replace it?';
    begin
        if IsolatedStorage.Contains(GetLicenseStorageKey(), DataScope::Module) then
            if Confirm(PromptToDeleteMsgL, false) then
                IsolatedStorage.Delete(GetLicenseStorageKey(), DataScope::Module);
    end;

    local procedure GetLicenseStorageKey(): Text
    var
        LicenseStorageKeyL: Label 'LIC';
    begin
        exit(LicenseStorageKeyL);
    end;
}