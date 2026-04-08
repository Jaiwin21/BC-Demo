pageextension 50101 "JPR Customer Card Ext" extends "Customer Card"
{
    layout
    {
        modify("Phone No.")
        {
            ShowMandatory = true;
        }

        modify("Address")
        {
            ShowMandatory = true;
        }
        addlast(General)
        {
            field("JPR External Ref."; Rec."JPR External Ref.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the external reference for this customer.';
                ShowMandatory = true;
            }
        }
        // Test
    }
}