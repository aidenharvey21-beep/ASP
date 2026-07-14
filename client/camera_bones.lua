--========================================================--
-- AirSupportPro
-- Camera Bone System
-- Version: 0.3.0
--========================================================--

ASP = ASP or {}

ASP.Client = ASP.Client or {}

ASP.Client.CameraBones = ASP.Client.CameraBones or {}


ASP.Client.CameraBones.Bones = {

    polmav = "chassis",

    maverick = "chassis",

    frogger = "chassis",

    buzzard = "chassis"

}



function ASP.Client.CameraBones.GetBone(vehicle)

    local model = GetEntityModel(vehicle)

    local modelName = nil


    for name, bone in pairs(ASP.Client.CameraBones.Bones) do

        if model == GetHashKey(name) then

            modelName = bone

            break

        end

    end


    return modelName

end



function ASP.Client.CameraBones.Attach(cam, vehicle)

    local boneName =
        ASP.Client.CameraBones.GetBone(vehicle)


    if not boneName then

        boneName = "chassis"

    end



    local boneIndex =
        GetEntityBoneIndexByName(
            vehicle,
            boneName
        )



    if boneIndex == -1 then

        return false

    end



    AttachCamToVehicleBone(

        cam,

        vehicle,

        boneIndex,

        true,

        0.0,

        0.0,

        0.0,

        true

    )


    return true

end



ASP.Utils.Debug(
    "Camera bone system loaded"
)
