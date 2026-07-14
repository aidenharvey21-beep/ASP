```lua
--========================================================--
-- AirSupportPro
-- Helicopter Camera System
-- Version: 0.2.0
--
-- Handles:
--  - Helicopter camera creation
--  - Camera attachment
--  - Zoom control
--  - Gimbal movement
--  - Camera lifecycle
--
-- Future integrations:
--  - FLIR
--  - Target tracking
--  - Spotlight
--  - Orbit system
--========================================================--


ASP = ASP or {}

ASP.Client = ASP.Client or {}

ASP.Client.Camera = ASP.Client.Camera or {}



--========================================================--
-- CAMERA STATE
--========================================================--

ASP.Client.Camera.State = {

    Active = false,

    Handle = nil,

    Helicopter = nil,


    FOV = Config.Camera.DefaultFOV,


    Rotation = {

        x = 0.0,

        y = 0.0,

        z = 0.0

    }

}



--========================================================--
-- CREATE CAMERA
--========================================================--

---Creates and activates helicopter camera.
---@param helicopter number
---@return boolean
function ASP.Client.Camera.Start(helicopter)


    if not DoesEntityExist(helicopter) then

        ASP.Client.Utils.ASPNotify(
            "No helicopter detected"
        )

        return false

    end



    if ASP.Client.Camera.State.Active then

        return true

    end



    local camera =
        CreateCam(
            "DEFAULT_SCRIPTED_CAMERA",
            true
        )



    if not camera then

        return false

    end



    ASP.Client.Camera.State.Handle =
        camera


    ASP.Client.Camera.State.Helicopter =
        helicopter



    ASP.Client.Camera.State.Active =
        true



    ASP.Client.Camera.State.FOV =
        Config.Camera.DefaultFOV



    AttachCamToEntity(

        camera,

        helicopter,

        Config.Camera.CameraOffset.x,

        Config.Camera.CameraOffset.y,

        Config.Camera.CameraOffset.z,

        true

    )



    SetCamFov(

        camera,

        ASP.Client.Camera.State.FOV

    )



    RenderScriptCams(

        true,

        true,

        500,

        true,

        true

    )



    ASP.Client.State.Camera =
        camera



    ASP.Client.Utils.ASPNotify(
        "Helicopter camera activated"
    )


    return true

end



--========================================================--
-- STOP CAMERA
--========================================================--

---Stops and destroys helicopter camera.
function ASP.Client.Camera.Stop()


    if not ASP.Client.Camera.State.Active then

        return

    end



    local camera =
        ASP.Client.Camera.State.Handle



    if camera then

        RenderScriptCams(

            false,

            true,

            500,

            true,

            true

        )


        DestroyCam(

            camera,

            false

        )

    end



    ASP.Client.Camera.State = {

        Active = false,

        Handle = nil,

        Helicopter = nil,

        FOV = Config.Camera.DefaultFOV,

        Rotation = {

            x = 0.0,

            y = 0.0,

            z = 0.0

        }

    }



    ASP.Client.State.CameraActive =
        false


    ASP.Client.State.Camera =
        nil


    ASP.Client.Utils.ASPNotify(
        "Helicopter camera disabled"
    )

end



--========================================================--
-- CAMERA ROTATION
--========================================================--

function ASP.Client.Camera.HandleRotation()


    if not ASP.Client.Camera.State.Active then

        return

    end



    local rotation =
        ASP.Client.Camera.State.Rotation



    local speed =
        Config.Camera.RotationSpeed



    if IsControlPressed(
        0,
        241
    ) then

        rotation.x =
            rotation.x + speed

    end



    if IsControlPressed(
        0,
        242
    ) then

        rotation.x =
            rotation.x - speed

    end



    if IsControlPressed(
        0,
        1
    ) then

        rotation.z =
            rotation.z - speed

    end



    if IsControlPressed(
        0,
        2
    ) then

        rotation.z =
            rotation.z + speed

    end



    SetCamRot(

        ASP.Client.Camera.State.Handle,

        rotation.x,

        rotation.y,

        rotation.z,

        2

    )

end



--========================================================--
-- ZOOM SYSTEM
--========================================================--

function ASP.Client.Camera.HandleZoom()


    if not ASP.Client.Camera.State.Active then

        return

    end



    local fov =
        ASP.Client.Camera.State.FOV



    if IsControlPressed(
        0,
        241
    ) then

        fov =
            fov - Config.Camera.ZoomSpeed

    end



    if IsControlPressed(
        0,
        242
    ) then

        fov =
            fov + Config.Camera.ZoomSpeed

    end



    fov =
        math.max(

            Config.Camera.MinFOV,

            math.min(

                fov,

                Config.Camera.MaxFOV

            )

        )



    ASP.Client.Camera.State.FOV =
        fov



    SetCamFov(

        ASP.Client.Camera.State.Handle,

        fov

    )

end



--========================================================--
-- CAMERA THREAD
--========================================================--

CreateThread(function()


    while true do


        local wait =
            1000



        if ASP.Client.Camera.State.Active then


            wait = 0


            ASP.Client.Camera.HandleRotation()

            ASP.Client.Camera.HandleZoom()


        end



        Wait(wait)

    end

end)



--========================================================--
-- EXPORTS
--========================================================--

exports(
    "StartCamera",
    function()

        local heli =
            ASP.Client.GetHelicopter()


        if heli then

            return ASP.Client.Camera.Start(
                heli
            )

        end


        return false

    end
)



exports(
    "StopCamera",
    function()

        ASP.Client.Camera.Stop()

    end
)



ASP.Utils.Debug(
    "Camera module loaded"
)
```
