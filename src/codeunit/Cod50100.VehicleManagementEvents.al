codeunit 50100 VehicleManagementEvents
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Company-Initialize", 'OnAfterInitSetupTables', '', false, false)]
    local procedure InitVehicleSetup()
    var
        VehicleManagementSetup: Record "Vehicle Management Setup";
    begin
        if not VehicleManagementSetup.Get() then begin
            VehicleManagementSetup.Init();
            VehicleManagementSetup.Insert();
        end;
    end;

    internal procedure mymeth(var myrec: Record Vehicle; HideDialog: Boolean)
    var
        IsHandled: Boolean;
    begin
        if not Confirmmymeth(myrec, HideDialog) then exit;
        OnBeforemymeth(myrec, IsHandled);
        Domymeth(myrec, IsHandled);
        OnAftermymeth(myrec);
        Acknowledgemymeth(myrec, HideDialog)
    end;

    local procedure Domymeth(var myrec: Record Vehicle; IsHandled: Boolean);
    begin
        if IsHandled then
            exit;


    end;

    local procedure Confirmmymeth(var myrec: Record Vehicle; HideDialog: Boolean): Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        ConfirmQst: Label 'Are You Sure?';
        DefaultAnswer: Boolean;
    begin
        DefaultAnswer := true;

        if HideDialog then exit(DefaultAnswer);
        exit(ConfirmManagement.GetResponseOrDefault(ConfirmQst, DefaultAnswer));
    end;

    local procedure Acknowledgemymeth(var myrec: Record Vehicle; HideDialog: Boolean)
    var
        AcknowledgeMsg: Label 'You successfully executed "mymethod"';
    begin
        if not GuiAllowed or HideDialog then exit;
        Message(AcknowledgeMsg);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforemymeth(var myrec: Record Vehicle; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAftermymeth(var myrec: Record Vehicle);
    begin
    end;
}