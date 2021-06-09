codeunit 50103 "Customers With Shows Filter"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Filter Tokens", 'OnResolveTextFilterToken', '', true, true)]
    local procedure FilterMyAccounts(TextToken: Text; var TextFilter: Text; var Handled: Boolean)
    var
        CustomerL: Record Customer;
        CustomerTelevisionShowsL: Record "Customer Television Show";
        CustWithShowsTokenTxtL: Label 'CUSTWITHSHOWS';
        MaxCountL: Integer;
    begin
        if StrPos(UpperCase(CustWithShowsTokenTxtL), UpperCase(TextToken)) = 0 then
            exit;

        MaxCountL := 2000;
        TextFilter := '';

        if CustomerL.FindSet() then begin
            repeat
                CustomerTelevisionShowsL.SetRange("Customer No.", CustomerL."No.");
                if not CustomerTelevisionShowsL.IsEmpty() then begin
                    MaxCountL -= 1;

                    if TextFilter <> '' then
                        TextFilter += '|';

                    TextFilter += CustomerL."No.";
                end;
            until (CustomerL.Next() = 0) or (MaxCountL <= 0);
        end;
    end;
}