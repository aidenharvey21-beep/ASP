--========================================================--
-- AirSupportPro
-- Camera Stabilization System
-- Version: 0.3.1
--========================================================--

ASP = ASP or {}

ASP.Client = ASP.Client or {}

ASP.Client.Stabilization = ASP.Client.Stabilization or {}



ASP.Client.Stabilization.Enabled = true



function ASP.Client.Stabilization.Apply(cam)

    if not Config.Camera.Stabilization then
        return
    end


    if not DoesCamExist(cam) then
        return
    end


    local heli =
        ASP.Client.Camera.State.Helicopter


    if not heli then
        return
    end



    local heliRotation =
        GetEntityRotation(
            heli,
            2
        )



    local camRotation =
        GetCamRot(
            cam,
            2
        )



    local smooth = 0.15



    local stabilizedX =
        camRotation.x -
        (heliRotation.x * smooth)



    local stabilizedY =
        camRotation.y -
        (heliRotation.y * smooth)



    SetCamRot(

        cam,

        stabilizedX,

        stabilizedY,

        camRotation.z,

        2

    )

end



ASP.Utils.Debug(
    "Camera stabilization loaded"
)
