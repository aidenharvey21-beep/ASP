--========================================================--
-- AirSupportPro
-- Helicopter Camera System
-- Version: 0.2.0
--========================================================--

ASP = ASP or {}

ASP.Client = ASP.Client or {}

ASP.Client.Camera = ASP.Client.Camera or {}


ASP.Client.Camera.State = {

    Active = false,

    Handle = nil,

    Helicopter = nil,

    FOV = Config.Camera.DefaultFOV

}



--========================================================--
-- START CAMERA
--========================================================--

function ASP.Client.Camera.Start(helicopter)


    if not DoesEntityExist(helicopter) then

        return false

    end


    if ASP.Client.Camera.State.Active then

        return true

    end



    local cam = CreateCam(
        "DEFAULT_SCRIPTED_CAMERA",
        true
    )


    if not cam then

        return false

    end



    ASP.Client.Camera.State.Handle = cam

    ASP.Client.Camera.State.Helicopter = helicopter

    ASP.Client.Camera.State.Active = true



    AttachCamToEntity(

        cam,

        helicopter,

        0.0,

        2.8,

        -1.5,

        true

    )



    SetCamFov(

        cam,

        Config.Camera.DefaultFOV

    )



    RenderScriptCams(

        true,

        true,

        500,

        true,

        true

    )



    ASP.Client.Utils.ASPNotify(
        "Helicopter camera activated"
    )


    return true

end



--========================================================--
-- STOP CAMERA
--========================================================--

function ASP.Client.Camera.Stop()


    if not ASP.Client.Camera.State.Active then

        return

    end



    RenderScriptCams(

        false,

        true,

        500,

        true,

        true

    )



    DestroyCam(

        ASP.Client.Camera.State.Handle,

        false

    )



    ASP.Client.Camera.State.Active = false

    ASP.Client.Camera.State.Handle = nil

    ASP.Client.Camera.State.Helicopter = nil



    ASP.Client.Utils.ASPNotify(
        "Helicopter camera disabled"
    )


end



--========================================================--
-- CAMERA MOVEMENT
--========================================================--

function ASP.Client.Camera.HandleRotation()

    if not ASP.Client.Camera.State.Active then
        return
    end


    local cam = ASP.Client.Camera.State.Handle

    if not cam then
        return
    end


    local rotation = GetCamRot(cam, 2)


    local horizontal =
        GetDisabledControlNormal(0, 1)

    local vertical =
        GetDisabledControlNormal(0, 2)


    local sensitivity = 10.0


    local newZ =
        rotation.z - (horizontal * sensitivity)


    local newX =
        rotation.x - (vertical * sensitivity)



    if newX > 60.0 then
        newX = 60.0
    end


    if newX < -60.0 then
        newX = -60.0
    end



    SetCamRot(

        cam,

        newX,

        rotation.y,

        newZ,

        2

    )

end
--========================================================--
-- CAMERA ZOOM
--========================================================--

function ASP.Client.Camera.HandleZoom()

    if not ASP.Client.Camera.State.Active then
        return
    end


    local cam = ASP.Client.Camera.State.Handle

    if not cam then
        return
    end


    local fov = GetCamFov(cam)


    -- Read mouse wheel while controls are disabled
    local zoomIn = IsDisabledControlJustPressed(0, 241)
    local zoomOut = IsDisabledControlJustPressed(0, 242)


    if zoomIn then

        fov = fov - Config.Camera.ZoomSpeed

    end


    if zoomOut then

        fov = fov + Config.Camera.ZoomSpeed

    end



    if fov < Config.Camera.MinFOV then

        fov = Config.Camera.MinFOV

    end


    if fov > Config.Camera.MaxFOV then

        fov = Config.Camera.MaxFOV

    end



    SetCamFov(cam, fov)

end
--========================================================--
-- CAMERA LOOP
--========================================================--

CreateThread(function()

    while true do

        local wait = 1000


        if ASP.Client.Camera.State.Active then

            wait = 0


            -- Disable GTA weapon/radio controls while camera is active

            -- Weapon cycling
            DisableControlAction(0, 14, true)
            DisableControlAction(0, 15, true)

            -- Weapon wheel
            DisableControlAction(0, 37, true)

            -- Weapon selection
            DisableControlAction(0, 16, true)
            DisableControlAction(0, 17, true)

            -- Vehicle weapon selection
            DisableControlAction(0, 84, true)
            DisableControlAction(0, 85, true)

            -- Radio wheel / station selection
            DisableControlAction(0, 81, true)
            DisableControlAction(0, 82, true)

            -- Mouse wheel
            DisableControlAction(0, 241, true)
            DisableControlAction(0, 242, true)

            DisablePlayerFiring(PlayerId(), true)


            -- Hide GTA weapon/radio UI


            HideHudComponentThisFrame(14)
            HideHudComponentThisFrame(19) -- weapon wheel
            HideHudComponentThisFrame(20) -- weapon wheel stats
            HideHudComponentThisFrame(22) -- weapon icon

            SetUserRadioControlEnabled(false)

            ASP.Client.Camera.HandleRotation()
            ASP.Client.Camera.HandleZoom()


        end


        Wait(wait)

    end

end)



ASP.Utils.Debug(
    "Camera module loaded"
)
