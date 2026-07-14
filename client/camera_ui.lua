--========================================================--
-- AirSupportPro
-- Camera Operator Display
-- Version: 0.3.5
--
-- Advanced EO/IR Sensor Display
-- Dynamic Camera Modes
--
-- NORMAL = White
-- THERMAL WHITE HOT = White/Gray
-- THERMAL BLACK HOT = Amber
-- NIGHT VISION = Green
--========================================================--


ASP = ASP or {}

ASP.Client = ASP.Client or {}

ASP.Client.CameraUI = ASP.Client.CameraUI or {}


ASP.Client.CameraUI.Mode = "NORMAL"

ASP.Client.CameraUI.Target = "NONE"



--========================================================--
-- SENSOR COLOR SYSTEM
--========================================================--

local function GetSensorColor()

    local mode = ASP.Client.CameraUI.Mode


    if mode == "NIGHT VISION" then

        return {
            r = 0,
            g = 255,
            b = 80,
            a = 220
        }


    elseif mode == "THERMAL BLACK HOT" then

        return {
            r = 255,
            g = 150,
            b = 40,
            a = 220
        }


    elseif mode == "THERMAL WHITE HOT" then

        return {
            r = 230,
            g = 230,
            b = 230,
            a = 220
        }


    else

        return {
            r = 255,
            g = 255,
            b = 255,
            a = 220
        }

    end

end



--========================================================--
-- TEXT FUNCTION
--========================================================--

local function DrawText2D(text, x, y, scale)

    local color = GetSensorColor()


    SetTextFont(4)

    SetTextScale(scale, scale)

    SetTextColour(
        color.r,
        color.g,
        color.b,
        color.a
    )

    SetTextOutline()

    SetTextCentre(false)


    BeginTextCommandDisplayText(
        "STRING"
    )

    AddTextComponentSubstringPlayerName(
        text
    )

    EndTextCommandDisplayText(
        x,
        y
    )

end



--========================================================--
-- CAMERA FRAME
--========================================================--

local function DrawCameraFrame()

    local color = GetSensorColor()


    local alpha = 130

    local thickness = 0.0015

    local length = 0.035



    local points = {

        {0.06,0.06},
        {0.94,0.06},
        {0.06,0.94},
        {0.94,0.94}

    }



    -- TOP LEFT

    DrawRect(
        0.06,
        0.06,
        length,
        thickness,
        color.r,
        color.g,
        color.b,
        alpha
    )

    DrawRect(
        0.06,
        0.06,
        thickness,
        length,
        color.r,
        color.g,
        color.b,
        alpha
    )



    -- TOP RIGHT

    DrawRect(
        0.94,
        0.06,
        length,
        thickness,
        color.r,
        color.g,
        color.b,
        alpha
    )

    DrawRect(
        0.94,
        0.06,
        thickness,
        length,
        color.r,
        color.g,
        color.b,
        alpha
    )



    -- BOTTOM LEFT

    DrawRect(
        0.06,
        0.94,
        length,
        thickness,
        color.r,
        color.g,
        color.b,
        alpha
    )

    DrawRect(
        0.06,
        0.94,
        thickness,
        length,
        color.r,
        color.g,
        color.b,
        alpha
    )



    -- BOTTOM RIGHT

    DrawRect(
        0.94,
        0.94,
        length,
        thickness,
        color.r,
        color.g,
        color.b,
        alpha
    )

    DrawRect(
        0.94,
        0.94,
        thickness,
        length,
        color.r,
        color.g,
        color.b,
        alpha
    )

end



--========================================================--
-- EO/IR CENTER RETICLE
--========================================================--

local function DrawReticle()

    local color = GetSensorColor()


    local x = 0.5

    local y = 0.5



    -- Center dot

    DrawRect(
        x,
        y,
        0.003,
        0.003,
        color.r,
        color.g,
        color.b,
        255
    )



    -- Vertical markers

    DrawRect(
        x,
        y - 0.018,
        0.0015,
        0.015,
        color.r,
        color.g,
        color.b,
        200
    )


    DrawRect(
        x,
        y + 0.018,
        0.0015,
        0.015,
        color.r,
        color.g,
        color.b,
        200
    )



    -- Horizontal markers

    DrawRect(
        x - 0.018,
        y,
        0.015,
        0.0015,
        color.r,
        color.g,
        color.b,
        200
    )


    DrawRect(
        x + 0.018,
        y,
        0.015,
        0.0015,
        color.r,
        color.g,
        color.b,
        200
    )

end
--========================================================--
-- FLIGHT DATA FUNCTIONS
--========================================================--

local function GetAircraftData()

    local ped = PlayerPedId()

    local vehicle = GetVehiclePedIsIn(
        ped,
        false
    )


    if vehicle == 0 then

        return {

            speed = 0,

            altitude = 0,

            heading = 0,

            plate = "NONE"

        }

    end



    local speed =
        GetEntitySpeed(vehicle) * 1.94384


    local coords =
        GetEntityCoords(vehicle)


    local altitude =
        math.floor(coords.z * 3.28084)



    local heading =
        math.floor(
            GetEntityHeading(vehicle)
        )



    local plate =
        GetVehicleNumberPlateText(vehicle)



    return {

        speed = math.floor(speed),

        altitude = altitude,

        heading = heading,

        plate = plate

    }

end



--========================================================--
-- HEADING TAPE
--========================================================--

local function DrawHeadingTape(heading)

    local color = GetSensorColor()


    local text = "N"


    if heading >= 23 and heading < 68 then

        text = "NE"

    elseif heading >= 68 and heading < 113 then

        text = "E"

    elseif heading >= 113 and heading < 158 then

        text = "SE"

    elseif heading >= 158 and heading < 203 then

        text = "S"

    elseif heading >= 203 and heading < 248 then

        text = "SW"

    elseif heading >= 248 and heading < 293 then

        text = "W"

    elseif heading >= 293 and heading < 338 then

        text = "NW"

    end



    DrawText2D(

        "W  ─────▼─────  E",

        0.425,

        0.105,

        0.30

    )


    DrawText2D(

        text,

        0.495,

        0.075,

        0.35

    )

end



--========================================================--
-- GIMBAL DISPLAY
--========================================================--

local function DrawGimbal()

    DrawText2D(

        "◖──────────────◗",

        0.445,

        0.845,

        0.35

    )


    DrawText2D(

        "GIMBAL STABLE",

        0.440,

        0.875,

        0.25

    )

end



--========================================================--
-- CAMERA DISPLAY
--========================================================--

function ASP.Client.CameraUI.Draw()


    if not ASP.Client.Camera.State.Active then

        return

    end



    local cam =
        ASP.Client.Camera.State.Handle



    if not cam then

        return

    end



    local data =
        GetAircraftData()



    DrawCameraFrame()

    DrawReticle()



    DrawHeadingTape(
        data.heading
    )



    local fov =
        GetCamFov(cam)



    local zoom =
        math.floor(
            (60.0 / fov) * 10
        ) / 10



    --================================================--
    -- TOP LEFT SENSOR DATA
    --================================================--

    DrawText2D(

        "CAM  MX-10",

        0.075,

        0.075,

        0.30

    )


    DrawText2D(

        "SPD "..data.speed.." KTS",

        0.075,

        0.110,

        0.30

    )


    DrawText2D(

        "ALT "..data.altitude.." FT",

        0.075,

        0.145,

        0.30

    )


    DrawText2D(

        "HDG "..string.format(
            "%03d",
            data.heading
        ),

        0.075,

        0.180,

        0.30

    )



    --================================================--
    -- TOP RIGHT TARGET DATA
    --================================================--

    DrawText2D(

        "TARGET",

        0.820,

        0.075,

        0.30

    )


    DrawText2D(

        ASP.Client.CameraUI.Target,

        0.820,

        0.110,

        0.30

    )


    DrawText2D(

        "PLT "..data.plate,

        0.820,

        0.145,

        0.30

    )



    --================================================--
    -- BOTTOM INFORMATION
    --================================================--

    DrawText2D(

        "HDIR",

        0.075,

        0.830,

        0.28

    )


    DrawText2D(

        "FOC AUT",

        0.075,

        0.865,

        0.28

    )


    DrawText2D(

        "EXP AUT",

        0.075,

        0.900,

        0.28

    )



    DrawText2D(

        "ZOOM "..zoom.."X",

        0.820,

        0.900,

        0.30

    )



    DrawGimbal()



    --================================================--
    -- SENSOR STATUS
    --================================================--

    DrawText2D(

        "GEPOINT",

        0.075,

        0.940,

        0.25

    )


    DrawText2D(

        "INS NAV 0.00°",

        0.075,

        0.965,

        0.25

    )


    DrawText2D(

        "TRK ENT",

        0.820,

        0.940,

        0.25

    )


    DrawText2D(

        "SLAVE READY",

        0.820,

        0.965,

        0.25

    )

end



--========================================================--
-- CAMERA UI LOOP
--========================================================--

CreateThread(function()

    while true do

        Wait(0)


        if ASP.Client.Camera.State.Active then

            ASP.Client.CameraUI.Draw()

        end

    end

end)



ASP.Utils.Debug(
    "EO/IR tactical camera display loaded"
)
