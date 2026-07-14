Config = {}

--========================================================--
-- AirSupportPro Configuration
-- Version: 0.1.0
--
-- This file controls all user-adjustable settings.
-- Avoid editing client/server files unless you know Lua.
--========================================================--


--========================================================--
-- GENERAL SETTINGS
--========================================================--

Config.Debug = false

-- Enables standalone operation.
-- ASP does not require ESX/QBCore.
Config.Framework = "standalone"

-- Enable OneSync features
Config.OneSyncRequired = true


--========================================================--
-- PERMISSIONS
--========================================================--

Config.Permissions = {

    -- If enabled, only ACE-authorized users can use ASP
    Enabled = false,

    ACEPermission = "airsupport.use"
}


--========================================================--
-- HELICOPTER SETTINGS
--========================================================--

Config.Helicopters = {

    -- If false, ASP works with every helicopter
    WhitelistEnabled = true,

    AllowedModels = {

        -- Police / Law Enforcement
        "polmav",

        -- Civilian helicopters
        "maverick",

        -- EMS
        "ambulance"
    }
}


--========================================================--
-- CONTROL SETTINGS
--========================================================--

Config.Controls = {

    -- Toggle helicopter camera
    ToggleCamera = {
        Enabled = true,
        Key = "E"
    },


    -- Toggle orbit autopilot
    ToggleOrbit = {
        Enabled = true,
        Key = "O"
    },


    -- Lock onto target
    LockTarget = {
        Enabled = true,
        Key = "L"
    },


    -- Hover mode
    ToggleHover = {
        Enabled = true,
        Key = "H"
    },


    -- Increase orbit radius
    IncreaseRadius = {
        Enabled = true,
        Key = "PAGEUP"
    },


    -- Decrease orbit radius
    DecreaseRadius = {
        Enabled = true,
        Key = "PAGEDOWN"
    }
}


--========================================================--
-- CAMERA SETTINGS
--========================================================--

Config.Camera = {

    Enabled = true,

    DefaultFOV = 45.0,

    MinFOV = 5.0,

    MaxFOV = 60.0,


    -- Zoom sensitivity
    ZoomSpeed = 2.0,


    -- Camera movement smoothing
    Stabilization = true,


    -- Camera update rate
    UpdateRate = 0
}


--========================================================--
-- FLIR SETTINGS
--========================================================--

Config.FLIR = {

    Enabled = true,


    -- Thermal vision
    Thermal = true,


    -- Night vision
    NightVision = true,


    -- Default mode
    Mode = "whitehot",


    -- Available modes:
    --
    -- whitehot
    -- blackhot
    -- nightvision
}


--========================================================--
-- ORBIT AUTOPILOT SETTINGS
--========================================================--

Config.Orbit = {

    Enabled = true,


    -- Default distance from target
    DefaultRadius = 175.0,


    -- Minimum orbit distance
    MinimumRadius = 50.0,


    -- Maximum orbit distance
    MaximumRadius = 500.0,


    -- Default height above ground
    DefaultAltitude = 120.0,


    -- Maximum altitude correction
    AltitudeLimit = 500.0,


    -- Orbit speed
    DefaultSpeed = 18.0,


    -- Direction
    -- true = clockwise
    -- false = counter-clockwise
    Clockwise = true,


    -- Automatically face target
    FaceTarget = true,


    -- Predict moving target position
    TargetPrediction = true,


    PredictionMultiplier = 1.25
}


--========================================================--
-- HOVER MODE SETTINGS
--========================================================--

Config.Hover = {

    Enabled = true,


    -- Maintain altitude
    AltitudeHold = true,


    -- Position correction strength
    CorrectionStrength = 0.75,


    -- How often corrections run
    UpdateRate = 250
}


--========================================================--
-- SPOTLIGHT SETTINGS
--========================================================--

Config.Spotlight = {

    Enabled = true,


    -- Automatically track locked target
    AutoTrack = true,


    -- Smooth spotlight movement
    Smoothing = true,


    UpdateRate = 50
}


--========================================================--
-- RADAR SETTINGS
--========================================================--

Config.Radar = {

    Enabled = true,


    -- Show target speed
    Speed = true,


    -- Show distance
    Distance = true,


    -- Show heading
    Heading = true
}


--========================================================--
-- HUD SETTINGS
--========================================================--

Config.HUD = {

    Enabled = true,


    Position = {

        X = 0.85,

        Y = 0.75
    },


    ShowAltitude = true,

    ShowSpeed = true,

    ShowHeading = true,

    ShowTarget = true,

    ShowOrbitInfo = true
}


--========================================================--
-- PERFORMANCE SETTINGS
--========================================================--

Config.Performance = {

    -- Reduce calculations when not active
    IdleWait = 1000,


    -- Normal flight update interval
    ActiveWait = 100,


    -- Target tracking interval
    TrackingWait = 250,


    -- Enable optimization systems
    SmartThreads = true
}


--========================================================--
-- LOGGING
--========================================================--

Config.Logging = {

    Enabled = false,


    Prefix = "[AirSupportPro]"
}
Config.Camera = {

    Enabled = true,

    DefaultFOV = 45.0,

    MinFOV = 5.0,

    MaxFOV = 60.0,

    ZoomSpeed = 2.0,

    RotationSpeed = 4.0,

    Stabilization = true,

    AttachBone = "chassis",

    CameraOffset = {

        x = 0.0,

        y = 0.0,

        z = 0.0

    }

}
