codeunit 50102 "Vehicle Journal-Check Line"
{
    TableNo = "Vehicle Journal Line";

    trigger OnRun()
    var

        IsHandled: Boolean;

    begin
        OnBeforeCheckLine(Rec, IsHandled);
        if IsHandled then
            exit;
        CheckDateAllowed(Rec);
        Rec.TestField(Description, ErrorInfo.Create());
        Rec.TestField("Duration (h)", ErrorInfo.Create());
        Rec.TestField("Operation Date", ErrorInfo.Create());
        Rec.TestField("Operation Type", ErrorInfo.Create());
        Rec.TestField("Resource No.", ErrorInfo.Create());

        OnAfterCheckLine(Rec);
    end;

    local procedure CheckDateAllowed(Rec: Record "Vehicle Journal Line")
    var
        UserSetupManagement: Codeunit "User Setup Management";
        DateErr: Label 'Operation Date %1 is not allowed', Comment = '%1-date';
    begin
        if not UserSetupManagement.IsPostingDateValid(Rec."Operation Date") then
            Error(ErrorInfo.Create(StrSubstNo(DateErr, Rec."Operation Date"), true, Rec, Rec.FieldNo("Operation Date")));
    end;


    [IntegrationEvent(false, false)]
    local procedure OnAfterCheckLine(Rec: Record "Vehicle Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckLine(Rec: Record "Vehicle Journal Line"; var IsHandled: Boolean)
    begin
    end;
}
