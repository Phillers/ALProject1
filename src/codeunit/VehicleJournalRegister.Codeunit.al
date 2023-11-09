codeunit 50101 "Vehicle Journal-Register"
{
    internal procedure Register(var Rec: Record "Vehicle Journal Line"; HideDialog: Boolean)
    var
        VehicleJournalLine: Record "Vehicle Journal Line";
        IsHandled: Boolean;
    begin
        if not ConfirmRegister(Rec, HideDialog) then exit;
        VehicleJournalLine.Copy(Rec);
        OnBeforeRegister(VehicleJournalLine, IsHandled);
        DoRegister(VehicleJournalLine, IsHandled);
        OnAfterRegister(VehicleJournalLine);
        AcknowledgeRegister(VehicleJournalLine, HideDialog)
    end;

    var
        NextEntryNo: Integer;

    local procedure DoRegister(var VehicleJournalLine: Record "Vehicle Journal Line"; IsHandled: Boolean);
    var

    begin
        if IsHandled then
            exit;
        CheckJournalLines(VehicleJournalLine);
        RegisterJournalLines(VehicleJournalLine);
        DeleteJournalLines(VehicleJournalLine);
    end;

    local procedure ConfirmRegister(var Rec: Record "Vehicle Journal Line"; HideDialog: Boolean): Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        ConfirmQst: Label 'Are You Sure to register %1 lines?', Comment = '%1 - count';
        DefaultAnswer: Boolean;
    begin
        DefaultAnswer := true;

        if HideDialog then exit(DefaultAnswer);
        exit(ConfirmManagement.GetResponseOrDefault(StrSubstNo(ConfirmQst, Rec.Count), DefaultAnswer));
    end;

    local procedure AcknowledgeRegister(var Rec: Record "Vehicle Journal Line"; HideDialog: Boolean)
    var
        AcknowledgeMsg: Label 'You successfully registered lines up to line number %1', Comment = '%1 last line no';
    begin
        if not GuiAllowed or HideDialog then exit;
        Message(AcknowledgeMsg, Rec."Line No.");
    end;

    local procedure RegisterJournalLine(var VehicleJournalLine: Record "Vehicle Journal Line")
    var
        VehicleEntry: Record "Vehicle Entry";
    begin
        InitVehicleEntry(VehicleEntry);
        VehicleEntry.CopyFromJournal(VehicleJournalLine);
        VehicleEntry.Insert();
    end;

    local procedure InitVehicleEntry(var VehicleEntry: Record "Vehicle Entry")
    begin
        if NextEntryNo <> 0 then
            NextEntryNo += 1
        else
            InitNextEntryNo();
        VehicleEntry.Init();
        VehicleEntry."Entry No." := NextEntryNo;
    end;

    local procedure InitNextEntryNo()
    var
        VehicleEntry: Record "Vehicle Entry";
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        VehicleEntry.LockTable();
        NextEntryNo := FindRecordManagement.GetLastEntryIntFieldValue(VehicleEntry, VehicleEntry.FieldNo("Entry No.")) + 1;
    end;

    [ErrorBehavior(ErrorBehavior::Collect)]
    local procedure CheckJournalLines(var VehicleJournalLine: Record "Vehicle Journal Line")
    var
        TempErrorMessage: Record "Error Message" temporary;
        VehicleJournalCheckLine: Codeunit "Vehicle Journal-Check Line";
        NothingRegErr: Label 'Nothing to register';
        Errors: List of [ErrorInfo];
        error: ErrorInfo;
    begin
        if VehicleJournalLine.FindSet() then
            repeat
                if not VehicleJournalCheckLine.Run(VehicleJournalLine) then
                    TempErrorMessage.LogLastError();
            until VehicleJournalLine.Next() = 0
        else
            Error(NothingRegErr);
        if HasCollectedErrors then
            errors := GetCollectedErrors();
        foreach error in errors do
            if TempErrorMessage.LogMessage(error.RecordId, error.FieldNo, TempErrorMessage."Message Type"::Error, error.Message) = 0 then
                TempErrorMessage.LogSimpleMessage(TempErrorMessage."Message Type"::Error, error.Message);

        if TempErrorMessage.HasErrors(false) then
            TempErrorMessage.ShowErrorMessages(true);
    end;

    local procedure RegisterJournalLines(var VehicleJournalLine: Record "Vehicle Journal Line")
    begin
        if VehicleJournalLine.FindSet() then
            repeat
                RegisterJournalLine(VehicleJournalLine);
            until VehicleJournalLine.Next() = 0;
    end;

    local procedure DeleteJournalLines(var VehicleJournalLine: Record "Vehicle Journal Line")
    begin
        VehicleJournalLine.DeleteAll(false);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeRegister(var Rec: Record "Vehicle Journal Line"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterRegister(var Rec: Record "Vehicle Journal Line");
    begin
    end;
}
