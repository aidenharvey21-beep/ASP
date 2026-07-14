--========================================================--
-- AirSupportPro
-- Camera Operator HUD
-- Version: 0.3.2
--========================================================--

ASP = ASP or {}

ASP.Client = ASP.Client or {}

ASP.Client.CameraUI = ASP.Client.CameraUI or {}



ASP.Client.CameraUI.Mode = "NORMAL"

ASP.Client.CameraUI.Target = "NONE"



--========================================================--
-- DRAW TEXT
--========================================================--

local function DrawText2D(text, x, y, scale)

    SetTextFont(4)

    SetTextScale(scale, scale)

    SetTextColour(
        255,
        255,
        255,
        220
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
-- CROSSHAIR
--========================================================--

local function DrawReticle()

    local x = 0.5

    local y = 0.5


    DrawRect(
        x,
        y,
        0.002,
        0.03,
        255,
        255,
        255,
        180
    )


    DrawRect(
        x,
        y,
        0.03,
        0.002,
        255,
        255,
        255,
        180
    )


end



--========================================================--
-- CAMERA HUD
--========================================================--

function ASP.Client.CameraUI.Draw()


    if not ASP.Client.Camera.State.Active then

        return

    end



    DrawReticle()



    local fov =
        GetCamFov(
            ASP.Client.Camera.State.Handle
        )


    local zoom =
        math.floor(
            60.0 / fov
            * 10
        )
        / 10



    DrawText2D(

        "~b~AIRSUPPORT PRO",

        0.05,

        0.05,

        0.45

    )



    DrawText2D(

        "CAM: WESCAM MX-10",

        0.05,

        0.085,

        0.32

    )



    DrawText2D(

        "MODE: "..ASP.Client.CameraUI.Mode,

        0.05,

        0.115,

        0.32

    )



    DrawText2D(

        "TARGET: "..ASP.Client.CameraUI.Target,

        0.05,

        0.145,

        0.32

    )



    DrawText2D(

        "ZOOM: "..zoom.."X",

        0.05,

        0.175,

        0.32

    )



end



--========================================================--
-- HUD LOOP
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
    "Camera UI loaded"
)
