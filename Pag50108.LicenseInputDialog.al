page 50108 "License Input Dialog"
{
    PageType = StandardDialog;
    InstructionalText = 'Enter the license text';

    layout
    {
        area(Content)
        {
            field(LicenseText; LicenseTextG)
            {
                Caption = 'Enter license:';
                ApplicationArea = All;
            }
        }
    }

    var
        LicenseTextG: Text[10];

    procedure GetLicenseText(): Text
    begin
        exit(LicenseTextG);
    end;
}