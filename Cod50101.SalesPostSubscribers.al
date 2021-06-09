codeunit 50101 SalesPostSubscribers
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnAfterConfirmPost', '', false, false)]
    local procedure OnAfterConfirmPost(SalesHeader: Record "Sales Header")
    var
        CheckCustomerTelevisionShowsL: Codeunit "Check Cust. Television Shows";
    begin
        CheckCustomerTelevisionShowsL.CheckCustomerTelevisionShows(SalesHeader."Sell-to Customer No.");
    end;
}