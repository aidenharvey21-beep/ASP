--========================================================--
-- AirSupportPro
-- Client Main Controller
-- Version: 0.1.0
--
-- Core client initialization and state management.
-- This file controls the main ASP runtime.
--========================================================--


ASP = ASP or {}

ASP.Client = ASP.Client or {}

ASP.Client.State = ASP.Client.State or {}



--========================================================--
-- RESOURCE STATE
--========================================================--

ASP.Client.State = {

    Active = false,

    CameraActive = false,

    OrbitActive = false,

    HoverActive = false,

    FLIRActive = false,


    CurrentHelicopter = nil,

    CurrentTarget = nil,


    Camera = nil,


    Orbit = {

        Radius = Config.Orbit.DefaultRadius,

        Altitude = Config.Orbit.DefaultAltitude,

        Speed = Config.Orbit.DefaultSpeed,

        Clockwise = Config.Orbit.Clockwise

    }

}



--========================================================--
-- MODULE STATUS
--========================================================--

ASP.Client.Modules = {

    Camera = false,

    Orbit = false,

    FLIR = false,

    Spotlight = false,

    Tracking = false,

    HUD = false

}



--========================================================--
-- INITIALIZATION
--========================================================--

---Initializes AirSupportPro.
function ASP.Client.Initialize()

    ASP.Utils.Debug(
        "Initializing AirSupportPro client"
    )


    ASP.Client.State.Active = true


    ASP.Client.StartThreads()


    ASP.Utils.Debug(
        "AirSupportPro client initialized"
    )

end



--========================================================--
-- SHUTDOWN
--========================================================--

---Stops ASP systems safely.
function ASP.Client.Shutdown()

    ASP.Utils.Debug(
        "Stopping AirSupportPro"
    )


    ASP.Client.State.Active = false


    -- Remove active camera

    if ASP.Client.State.Camera then

        ASP.Client.Utils.DestroyCamera(
            ASP.Client.State.Camera
        )


        ASP.Client.State.Camera = nil

    end


    ASP.Client.State.CameraActive = false

    ASP.Client.State.OrbitActive = false

    ASP.Client.State.HoverActive = false


end



--========================================================--
-- STATE FUNCTIONS
--========================================================--

---Returns whether ASP is active.
---@return boolean
function ASP.Client.IsActive()

    return ASP.Client.State.Active

end



---Returns current helicopter.
---@return number|nil
function ASP.Client.GetHelicopter()

    return ASP.Client.State.CurrentHelicopter

end



---Returns current target.
---@return number|nil
function ASP.Client.GetTarget()

    return ASP.Client.State.CurrentTarget

end



---Updates current helicopter.
---@param vehicle number
function ASP.Client.SetHelicopter(vehicle)

    ASP.Client.State.CurrentHelicopter = vehicle

end



---Updates current target.
---@param entity number
function ASP.Client.SetTarget(entity)

    ASP.Client.State.CurrentTarget = entity

end



--========================================================--
-- MAIN THREADS
--========================================================--

function ASP.Client.StartThreads()


    -- Main monitoring thread

    CreateThread(function()

        while ASP.Client.State.Active do


            local canUse, heli =
                ASP.Client.Utils.CanUseAirSupport()



            if canUse then

                ASP.Client.SetHelicopter(
                    heli
                )


            else

                ASP.Client.SetHelicopter(
                    nil
                )


                -- Disable systems if leaving helicopter

                if ASP.Client.State.CameraActive then

                    ASP.Client.State.CameraActive = false

                end


                if ASP.Client.State.OrbitActive then

                    ASP.Client.State.OrbitActive = false

                end

            end



            Wait(
                ASP.Client.Utils.GetWaitTime(
                    canUse
                )
            )

        end

    end)



    -- State update thread

    CreateThread(function()

        while ASP.Client.State.Active do


            if ASP.Client.State.CurrentHelicopter then


                -- Future:
                -- Camera updates
                -- Orbit controller
                -- FLIR
                -- Spotlight
                -- Tracking


            end



            Wait(
                Config.Performance.ActiveWait
            )

        end

    end)

end



--========================================================--
-- EXPORT BACKEND FUNCTIONS
--========================================================--

exports(
    "IsAirSupportActive",
    function()

        return ASP.Client.IsActive()

    end
)



exports(
    "GetCurrentTarget",
    function()

        return ASP.Client.GetTarget()

    end
)



exports(
    "GetCameraState",
    function()

        return ASP.Client.State.CameraActive

    end
)



exports(
    "StartOrbit",
    function()

        ASP.Client.State.OrbitActive = true

    end
)



exports(
    "StopOrbit",
    function()

        ASP.Client.State.OrbitActive = false

    end
)



--========================================================--
-- RESOURCE EVENTS
--========================================================--

AddEventHandler(
    "onClientResourceStart",
    function(resource)

        if resource ~= GetCurrentResourceName() then
            return
        end


        ASP.Client.Initialize()

    end
)



AddEventHandler(
    "onClientResourceStop",
    function(resource)

        if resource ~= GetCurrentResourceName() then
            return
        end


        ASP.Client.Shutdown()

    end
)



ASP.Utils.Debug(
    "Client main loaded"
)
