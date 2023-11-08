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

}