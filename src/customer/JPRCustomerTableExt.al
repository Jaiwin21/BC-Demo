tableextension 50100 "JPR Customer Ext" extends Customer
{
    fields
    {
        field(50100; "JPR External Ref."; Code[20])
        {
            Caption = 'JPR External Ref.';
            DataClassification = CustomerContent;
        }
    }

    trigger OnBeforeInsert()
    begin
        EnforceMandatoryFields();
    end;

    trigger OnBeforeModify()
    begin
        EnforceMandatoryFields();
    end;

    local procedure EnforceMandatoryFields()
    begin
        EnforceExternalRefWhenCustomerStarted();
        EnforcePhoneNoWhenCustomerStarted();
    end;

    local procedure EnforceExternalRefWhenCustomerStarted()
    begin
        if (Rec.Name <> '') and (Rec."JPR External Ref." = '') then
            Error('JPR External Ref. must be filled in before the customer can be saved.');
    end;

    local procedure EnforcePhoneNoWhenCustomerStarted()
    begin
        if (Rec.Name <> '') and (Rec."Phone No." = '') then
            Error('Phone No. must be filled in before customer can be saved')
    end;
}