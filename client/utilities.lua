--========================================================--
-- AirSupportPro
-- Client Utility Functions
-- Version: 0.1.0
--
-- Client-side utility functions shared between modules.
-- Handles entity, player, input, and game state checks.
--========================================================--


ASP = ASP or {}

ASP.Client = ASP.Client or {}

ASP.Client.Utils = ASP.Client.Utils or {}


--========================================================--
-- ENTITY FUNCTIONS
--========================================================--

---Safely requests network control of an entity.
---@param entity number
---@return boolean
function ASP.Client.Utils.RequestControl(entity)

    if not DoesEntityExist(entity) then
        return false
    end


    if NetworkHasControlOfEntity(entity) then
        return true
    end


    NetworkRequestControlOfEntity(entity)


    local timeout = 0


    while not NetworkHasControlOfEntity(entity)
    and timeout < 50 do

        Wait(10)

        timeout += 1

        NetworkRequestControlOfEntity(entity)

    end


    return NetworkHasControlOfEntity(entity)

end



---Deletes an entity safely.
---@param entity number
function ASP.Client.Utils.DeleteEntity(entity)

    if not DoesEntityExist(entity) then
        return
    end


    if ASP.Client.Utils.RequestControl(entity) then

        SetEntityAsMissionEntity(
            entity,
            true,
            true
        )


        DeleteEntity(entity)

    end

end



--========================================================--
-- PLAYER FUNCTIONS
--========================================================--

---Returns the current player ped.
---@return number
function ASP.Client.Utils.GetPlayer()

    return PlayerPedId()

end



---Returns the player's current vehicle.
---@return number
function ASP.Client.Utils.GetCurrentVehicle()

    local ped =
        PlayerPedId()


    return GetVehiclePedIsIn(
        ped,
        false
    )

end



---Checks whether player is inside a vehicle.
---@return boolean
function ASP.Client.Utils.IsInVehicle()

    local ped =
        PlayerPedId()


    return IsPedInAnyVehicle(
        ped,
        false
    )

end



---Checks whether player is the pilot.
---@param vehicle number
---@return boolean
function ASP.Client.Utils.IsPilot(vehicle)

    if not DoesEntityExist(vehicle) then
        return false
    end


    local ped =
        PlayerPedId()


    local driver =
        GetPedInVehicleSeat(
            vehicle,
            -1
        )


    return driver == ped

end



---Checks whether player is a passenger.
---@param vehicle number
---@return boolean
function ASP.Client.Utils.IsPassenger(vehicle)

    if not DoesEntityExist(vehicle) then
        return false
    end


    local ped =
        PlayerPedId()


    local seat =
        GetPedInVehicleSeat(
            vehicle,
            0
        )


    return seat == ped

end



--========================================================--
-- HELICOPTER STATE
--========================================================--

---Gets the helicopter the player is currently using.
---@return number|nil
function ASP.Client.Utils.GetCurrentHelicopter()

    local vehicle =
        ASP.Client.Utils.GetCurrentVehicle()


    if vehicle == 0 then
        return nil
    end


    if not ASP.Utils.IsHelicopter(vehicle) then
        return nil
    end


    return vehicle

end



---Checks if ASP can currently operate.
---@return boolean, number|nil
function ASP.Client.Utils.CanUseAirSupport()

    local heli =
        ASP.Client.Utils.GetCurrentHelicopter()


    if not heli then
        return false, nil
    end


    if not ASP.Utils.IsAllowedHelicopter(heli) then
        return false, heli
    end


    return true, heli

end



--========================================================--
-- INPUT FUNCTIONS
--========================================================--

---Checks if a control key was pressed.
---@param control number
---@return boolean
function ASP.Client.Utils.KeyPressed(control)

    return IsControlJustPressed(
        0,
        control
    )

end



---Disables helicopter controls temporarily.
---@param controls table
function ASP.Client.Utils.DisableControls(controls)

    for _, control in ipairs(controls) do

        DisableControlAction(
            0,
            control,
            true
        )

    end

end



--========================================================--
-- NOTIFICATIONS
--========================================================--

---Displays a notification.
---@param message string
function ASP.Client.Utils.Notify(message)

    BeginTextCommandThefeedPost(
        "STRING"
    )

    AddTextComponentSubstringPlayerName(
        message
    )

    EndTextCommandThefeedPostTicker(
        false,
        false
    )

end



---Displays an ASP formatted notification.
---@param message string
function ASP.Client.Utils.ASPNotify(message)

    ASP.Client.Utils.Notify(
        "~b~AirSupportPro~s~: " .. message
    )

end



--========================================================--
-- CAMERA HELPERS
--========================================================--

---Creates a scripted camera.
---@return number
function ASP.Client.Utils.CreateCamera()

    local camera =
        CreateCam(
            "DEFAULT_SCRIPTED_CAMERA",
            true
        )


    return camera

end



---Destroys a camera safely.
---@param camera number
function ASP.Client.Utils.DestroyCamera(camera)

    if not camera then
        return
    end


    DestroyCam(
        camera,
        false
    )


    RenderScriptCams(
        false,
        true,
        500,
        true,
        true
    )

end



--========================================================--
-- PERFORMANCE HELPERS
--========================================================--

---Returns optimized wait time depending on ASP state.
---@param active boolean
---@return number
function ASP.Client.Utils.GetWaitTime(active)

    if active then

        return Config.Performance.ActiveWait

    end


    return Config.Performance.IdleWait

end



--========================================================--
-- RESOURCE STATE
--========================================================--

ASP.Client.Utils.ResourceStarted = true


ASP.Utils.Debug(
    "Client utilities loaded"
)
