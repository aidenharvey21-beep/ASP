--========================================================--
-- AirSupportPro
-- Shared Helper Functions
-- Version: 0.1.0
--
-- Common functions used by client and server modules.
--========================================================--


ASP = ASP or {}

ASP.Utils = ASP.Utils or {}


--========================================================--
-- DEBUGGING
--========================================================--

---Prints a formatted debug message if debugging is enabled.
---@param message string
function ASP.Utils.Debug(message)

    if not Config or not Config.Debug then
        return
    end

    print(
        string.format(
            "^5[AirSupportPro]^7 %s",
            tostring(message)
        )
    )
end



--========================================================--
-- MODEL FUNCTIONS
--========================================================--

---Returns the hash of a model name.
---@param model string|number
---@return number
function ASP.Utils.GetModelHash(model)

    if type(model) == "number" then
        return model
    end

    return joaat(model)
end



---Checks whether an entity model matches a model name.
---@param entity number
---@param model string
---@return boolean
function ASP.Utils.IsModel(entity, model)

    if not DoesEntityExist(entity) then
        return false
    end

    return GetEntityModel(entity) == ASP.Utils.GetModelHash(model)
end



--========================================================--
-- ENTITY FUNCTIONS
--========================================================--

---Checks if an entity exists and is valid.
---@param entity number
---@return boolean
function ASP.Utils.ValidEntity(entity)

    return entity
        and entity ~= 0
        and DoesEntityExist(entity)
end



---Returns the vehicle an entity is currently inside.
---@param entity number
---@return number|nil
function ASP.Utils.GetVehicle(entity)

    if not ASP.Utils.ValidEntity(entity) then
        return nil
    end


    if IsPedInAnyVehicle(entity, false) then

        return GetVehiclePedIsIn(
            entity,
            false
        )

    end


    return nil
end



--========================================================--
-- HELICOPTER FUNCTIONS
--========================================================--

---Checks if a vehicle is a helicopter.
---@param vehicle number
---@return boolean
function ASP.Utils.IsHelicopter(vehicle)

    if not ASP.Utils.ValidEntity(vehicle) then
        return false
    end


    return IsThisModelAHeli(
        GetEntityModel(vehicle)
    )
end



---Checks if helicopter is allowed by config.
---@param vehicle number
---@return boolean
function ASP.Utils.IsAllowedHelicopter(vehicle)

    if not Config.Helicopters.WhitelistEnabled then
        return true
    end


    local model = GetEntityModel(vehicle)


    for _, allowed in ipairs(Config.Helicopters.AllowedModels) do

        if model == joaat(allowed) then
            return true
        end

    end


    return false
end



--========================================================--
-- VECTOR / MATH FUNCTIONS
--========================================================--

---Calculates distance between two vectors.
---@param first vector3
---@param second vector3
---@return number
function ASP.Utils.Distance(first, second)

    return #(first - second)

end



---Returns a normalized direction vector.
---@param vector vector3
---@return vector3
function ASP.Utils.Normalize(vector)

    local length =
        math.sqrt(
            vector.x * vector.x +
            vector.y * vector.y +
            vector.z * vector.z
        )


    if length == 0 then
        return vector3(0,0,0)
    end


    return vector3(

        vector.x / length,

        vector.y / length,

        vector.z / length
    )

end



---Converts degrees to radians.
---@param degrees number
---@return number
function ASP.Utils.DegToRad(degrees)

    return degrees * math.pi / 180

end



---Converts radians to degrees.
---@param radians number
---@return number
function ASP.Utils.RadToDeg(radians)

    return radians * 180 / math.pi

end



--========================================================--
-- TARGET FUNCTIONS
--========================================================--

---Gets the closest vehicle to coordinates.
---@param coords vector3
---@param radius number
---@return number|nil
function ASP.Utils.GetClosestVehicle(coords, radius)

    local vehicles =
        GetGamePool(
            "CVehicle"
        )


    local closest = nil

    local distance = radius or 9999.0



    for _, vehicle in ipairs(vehicles) do

        local vehicleCoords =
            GetEntityCoords(vehicle)


        local current =
            #(coords - vehicleCoords)


        if current < distance then

            closest = vehicle

            distance = current

        end

    end


    return closest

end



--========================================================--
-- PLAYER FUNCTIONS
--========================================================--

---Gets the player ped.
---@return number
function ASP.Utils.GetPlayerPed()

    return PlayerPedId()

end



---Checks if player is piloting a helicopter.
---@return boolean, number|nil
function ASP.Utils.IsPlayerInHelicopter()

    local ped =
        PlayerPedId()


    local vehicle =
        GetVehiclePedIsIn(
            ped,
            false
        )


    if vehicle == 0 then

        return false, nil

    end



    if not ASP.Utils.IsHelicopter(vehicle) then

        return false, vehicle

    end



    return true, vehicle

end



--========================================================--
-- RESOURCE INFORMATION
--========================================================--

ASP.Utils.Debug(
    "Shared helpers loaded"
)
