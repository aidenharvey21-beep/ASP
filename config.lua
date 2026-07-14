Config = {}

--========================================================--
-- AirSupportPro Configuration
-- Version: 0.2.0
--
-- Main configuration file
--========================================================--


--========================================================--
-- GENERAL SETTINGS
--========================================================--

Config.Debug = false

Config.Framework = "standalone"

Config.OneSyncRequired = true



--========================================================--
-- PERMISSIONS
--========================================================--

Config.Permissions = {

    Enabled = false,

    ACEPermission = "airsupport.use"

}



--========================================================--
-- HELICOPTER SETTINGS
--========================================================--

Config.Helicopters = {

    -- false allows all helicopters
    WhitelistEnabled = false,


    AllowedModels = {

        "polmav",

        "maverick",

        "frogger",

        "buzzard"

    }

}



--========================================================--
-- CONTROL SETTINGS
--========================================================--

Config.Controls = {


    ToggleCamera = {

        Enabled = true,

        Key = "E"

    },


    ToggleOrbit = {

        Enabled = true,

        Key = "O"

    },


    LockTarget = {

        Enabled = true,

        Key = "L"

    },


    ToggleHover = {

        Enabled = true,

        Key = "H"

    },


    IncreaseRadius = {

        Enabled = true,

        Key = "PAGEUP"

    },


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


    -- Default camera zoom

    DefaultFOV = 45.0,


    -- Zoom limits

    MinFOV = 5.0,

    MaxFOV = 60.0,


    -- Zoom speed

    ZoomSpeed = 2.0,


    -- Camera movement speed

    RotationSpeed = 4.0,


    -- Stabilization

    Stabilization = true,


    -- Camera update rate

    UpdateRate = 0,


    -- Camera attachment

    AttachBone = "chassis",


    CameraOffset = {

        x = 0.0,

        y = 2.5,

        z = -1.2

    }

}



--========================================================--
-- FLIR SETTINGS
--========================================================--

Config.FLIR = {


    Enabled = true,


    Thermal = true,


    NightVision = true,


    Mode = "whitehot"


}



--========================================================--
-- ORBIT SETTINGS
--========================================================--

Config.Orbit = {


    Enabled = true,


    DefaultRadius = 175.0,


    MinimumRadius = 50.0,


    MaximumRadius = 500.0,


    DefaultAltitude = 120.0,


    AltitudeLimit = 500.0,


    DefaultSpeed = 18.0,


    Clockwise = true,


    FaceTarget = true,


    TargetPrediction = true,


    PredictionMultiplier = 1.25

}



--========================================================--
-- HOVER SETTINGS
--========================================================--

Config.Hover = {


    Enabled = true,


    AltitudeHold = true,


    CorrectionStrength = 0.75,


    UpdateRate = 250

}



--========================================================--
-- SPOTLIGHT SETTINGS
--========================================================--

Config.Spotlight = {


    Enabled = true,


    AutoTrack = true,


    Smoothing = true,


    UpdateRate = 50

}



--========================================================--
-- RADAR SETTINGS
--========================================================--

Config.Radar = {


    Enabled = true,


    Speed = true,


    Distance = true,


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


    IdleWait = 1000,


    ActiveWait = 100,


    TrackingWait = 250,


    SmartThreads = true

}



--========================================================--
-- LOGGING
--========================================================--

Config.Logging = {


    Enabled = false,


    Prefix = "[AirSupportPro]"

}
