```lua
--========================================================--
-- AirSupportPro
-- Client Control System
-- Version: 0.1.0
--
-- Handles player input and keybind registration.
-- This file manages ASP user controls.
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

    IncreaseRadius = 10,     -- PAGE UP

    DecreaseRadius = 11      -- PAGE DOWN

}



--========================================================--
-- CONTROL CHECK
--========================================================--

---Checks whether a configured control was pressed.
---@param control number
---@return boolean
function ASP.Client.Controls.Pressed(control)

    return IsControlJustPressed(
        0,
        control
    )

end



--========================================================--
-- CAMERA CONTROL
--========================================================--

function ASP.Client.Controls.ToggleCamera()

    local state =
        ASP.Client.State


    state.CameraActive =
        not state.CameraActive


    if state.CameraActive then

        ASP.Client.Utils.ASPNotify(
            "Camera activated"
        )

    else

        ASP.Client.Utils.ASPNotify(
            "Camera disabled"
        )

    end

end



--========================================================--
-- ORBIT CONTROL
--========================================================--

function ASP.Client.Controls.ToggleOrbit()

    local state =
        ASP.Client.State


    state.OrbitActive =
        not state.OrbitActive



    if state.OrbitActive then

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
-- TARGET CONTROL
--========================================================--

function ASP.Client.Controls.LockTarget()

    ASP.Client.Utils.ASPNotify(
        "Target lock system not yet installed"
    )

end



--========================================================--
-- HOVER CONTROL
--========================================================--

function ASP.Client.Controls.ToggleHover()

    local state =
        ASP.Client.State


    state.HoverActive =
        not state.HoverActive



    if state.HoverActive then

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
-- ORBIT ADJUSTMENT
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
        .. math.floor(orbit.Radius)
        .. "m"
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
        .. math.floor(orbit.Radius)
        .. "m"
    )

end



--========================================================--
-- INPUT THREAD
--========================================================--

CreateThread(function()

    while true do


        local wait =
            1000


        if ASP.Client.State
        and ASP.Client.State.CurrentHelicopter then

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
                ASP.Client.Controls.Keys.LockTarget
            ) then

                ASP.Client.Controls.LockTarget()

            end



            if ASP.Client.Controls.Pressed(
                ASP.Client.Controls.Keys.ToggleHover
            ) then

                ASP.Client.Controls.ToggleHover()

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
-- KEY MAPPING SUPPORT
--========================================================--

RegisterKeyMapping(
    "asp_camera",
    "AirSupportPro: Toggle Camera",
    "keyboard",
    Config.Controls.ToggleCamera.Key
)


RegisterCommand(
    "asp_camera",
    function()

        ASP.Client.Controls.ToggleCamera()

    end
)



RegisterKeyMapping(
    "asp_orbit",
    "AirSupportPro: Toggle Orbit",
    "keyboard",
    Config.Controls.ToggleOrbit.Key
)


RegisterCommand(
    "asp_orbit",
    function()

        ASP.Client.Controls.ToggleOrbit()

    end
)



RegisterKeyMapping(
    "asp_hover",
    "AirSupportPro: Toggle Hover",
    "keyboard",
    Config.Controls.ToggleHover.Key
)


RegisterCommand(
    "asp_hover",
    function()

        ASP.Client.Controls.ToggleHover()

    end
)



ASP.Utils.Debug(
    "Client controls loaded"
)
```
