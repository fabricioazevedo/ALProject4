codeunit 50100 "Check Cust. Television Shows"
{
    procedure CheckCustomerTelevisionShows(CustomerNo: Code[20])
    begin
        ValidateFavoriteShowExists(CustomerNo);
    end;

    local procedure ValidateFavoriteShowExists(CustomerNo: Code[20])
    var
        CustomerTelevisionShowL: Record "Customer Television Show";
        NoFavoriteShowErrL: Label 'You need to define a favorite television show for Customer %1.';
    begin
        CustomerTelevisionShowL.SetRange("Customer No.", CustomerNo);
        CustomerTelevisionShowL.SetRange(Favorite, true);
        if CustomerTelevisionShowL.IsEmpty() then
            Error(NoFavoriteShowErrL, CustomerNo);
    end;
}