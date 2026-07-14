```lua
--========================================================--
-- AirSupportPro
-- Client Control System
-- Version: 0.2.0
--
-- Handles:
--  - Camera controls
--  - Orbit controls
--  - Hover controls
--  - Keybind management
--========================================================--


ASP = ASP or {}

ASP.Client = ASP.Client or {}

ASP.Client.Controls = ASP.Client.Controls or {}



--========================================================--
-- CONTROL DEFINITIONS
--========================================================--

ASP.Client.Controls.Keys = {

    ToggleCamera = 38,       -- E

    ToggleOrbit = 79,        -- O

    LockTarget = 182,        -- L

    ToggleHover = 74,        -- H

    IncreaseRadius = 10,     -- Page Up

    DecreaseRadius = 11      -- Page Down

}



--========================================================--
-- INPUT CHECK
--========================================================--

function ASP.Client.Controls.Pressed(control)

    return IsControlJustPressed(
        0,
        control
    )

end



--========================================================--
-- CAMERA TOGGLE
--========================================================--

function ASP.Client.Controls.ToggleCamera()


    local active, heli =
        ASP.Client.Utils.CanUseAirSupport()



    if not active then

        ASP.Client.Utils.ASPNotify(
            "You must be in an authorized helicopter"
        )

        return

    end



    if ASP.Client.Camera.State.Active then


        ASP.Client.Camera.Stop()


    else


        ASP.Client.Camera.Start(
            heli
        )


    end


end



--========================================================--
-- ORBIT CONTROL
--========================================================--

function ASP.Client.Controls.ToggleOrbit()


    ASP.Client.State.OrbitActive =
        not ASP.Client.State.OrbitActive



    if ASP.Client.State.OrbitActive then

        ASP.Client.Utils.ASPNotify(
            "Orbit mode enabled"
        )

    else

        ASP.Client.Utils.ASPNotify(
            "Orbit mode disabled"
        )

    end

end



--========================================================--
-- HOVER CONTROL
--========================================================--

function ASP.Client.Controls.ToggleHover()


    ASP.Client.State.HoverActive =
        not ASP.Client.State.HoverActive



    if ASP.Client.State.HoverActive then

        ASP.Client.Utils.ASPNotify(
            "Hover hold enabled"
        )

    else

        ASP.Client.Utils.ASPNotify(
            "Hover hold disabled"
        )

    end

end



--========================================================--
-- TARGET LOCK
--========================================================--

function ASP.Client.Controls.LockTarget()

    ASP.Client.Utils.ASPNotify(
        "Target tracking unavailable"
    )

end



--========================================================--
-- ORBIT RADIUS
--========================================================--

function ASP.Client.Controls.IncreaseRadius()


    local orbit =
        ASP.Client.State.Orbit



    orbit.Radius =
        math.min(

            orbit.Radius + 25,

            Config.Orbit.MaximumRadius

        )



    ASP.Client.Utils.ASPNotify(

        "Orbit radius: "
        ..
        math.floor(orbit.Radius)
        ..
        "m"

    )

end



function ASP.Client.Controls.DecreaseRadius()


    local orbit =
        ASP.Client.State.Orbit



    orbit.Radius =
        math.max(

            orbit.Radius - 25,

            Config.Orbit.MinimumRadius

        )



    ASP.Client.Utils.ASPNotify(

        "Orbit radius: "
        ..
        math.floor(orbit.Radius)
        ..
        "m"

    )

end



--========================================================--
-- MAIN CONTROL THREAD
--========================================================--

CreateThread(function()


    while true do


        local wait =
            1000



        if ASP.Client.State.CurrentHelicopter then


            wait = 0



            if ASP.Client.Controls.Pressed(
                ASP.Client.Controls.Keys.ToggleCamera
            ) then


                ASP.Client.Controls.ToggleCamera()


            end



            if ASP.Client.Controls.Pressed(
                ASP.Client.Controls.Keys.ToggleOrbit
            ) then


                ASP.Client.Controls.ToggleOrbit()


            end



            if ASP.Client.Controls.Pressed(
                ASP.Client.Controls.Keys.ToggleHover
            ) then


                ASP.Client.Controls.ToggleHover()


            end



            if ASP.Client.Controls.Pressed(
                ASP.Client.Controls.Keys.LockTarget
            ) then


                ASP.Client.Controls.LockTarget()


            end



            if ASP.Client.Controls.Pressed(
                ASP.Client.Controls.Keys.IncreaseRadius
            ) then


                ASP.Client.Controls.IncreaseRadius()


            end



            if ASP.Client.Controls.Pressed(
                ASP.Client.Controls.Keys.DecreaseRadius
            ) then


                ASP.Client.Controls.DecreaseRadius()


            end


        end



        Wait(wait)

    end

end)



--========================================================--
-- RESOURCE DEBUG
--========================================================--

ASP.Utils.Debug(
    "Controls module loaded"
)
```
