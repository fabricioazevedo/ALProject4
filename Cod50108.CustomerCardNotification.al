codeunit 50108 "Customer Card Notification"
{
    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterGetRecordEvent', '', false, false)]
    local procedure OnAfterGetRecordEvent(var Rec: Record Customer)
    begin
        HandleCustomerCardNotification(Rec."No.");
    end;

    local procedure HandleCustomerCardNotification(CustomerNo: Code[20])
    begin
        if CustomerNo = '' then
            exit;

        if not HasTelevisionEntries(CustomerNo) then
            ShowCustomerCardNotification(CustomerNo);
    end;

    local procedure HasTelevisionEntries(CustomerNo: Code[20]): Boolean
    var
        CustomerTelevisionShowL: Record "Customer Television Show";
    begin
        CustomerTelevisionShowL.SetRange("Customer No.", CustomerNo);
        exit(not CustomerTelevisionShowL.IsEmpty());
    end;

    local procedure ShowCustomerCardNotification(CustomerNo: Code[20])
    var
        CustomerCardNotificationL: Notification;
        NotificationMsgL: Label 'Customer %1 has no television shows. Do you want to set some up?';
        ActionYesTxtL: Label 'Yes';
    begin
        CustomerCardNotificationL.Message := StrSubstNo(NotificationMsgL, CustomerNo);
        CustomerCardNotificationL.Scope := NotificationScope::LocalScope;
        CustomerCardNotificationL.SetData('CustomerNo', CustomerNo);
        CustomerCardNotificationL.AddAction(ActionYesTxtL, CODEUNIT::"Customer Card Notification", 'OpenCustomerTelevisionShows');
        CustomerCardNotificationL.Send();
    end;

    procedure OpenCustomerTelevisionShows(CustomerCardNotification: Notification)
    var
        CustomerTelevisionShowL: Record "Customer Television Show";
        CustomerTelevisionShowsL: Page "Customer Television Shows";
        CustomerNoL: Code[20];
    begin
        CustomerNoL := CustomerCardNotification.GetData('CustomerNo');
        CustomerTelevisionShowL.SetRange("Customer No.", CustomerNoL);
        CustomerTelevisionShowsL.SetTableView(CustomerTelevisionShowL);
        CustomerTelevisionShowsL.Run();
    end;
}