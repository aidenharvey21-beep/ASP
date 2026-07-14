```lua
--========================================================--
-- AirSupportPro
-- Server Controller
-- Version: 0.1.0
--
-- Handles server-side initialization, permissions,
-- synchronization events, and future integrations.
--
-- ASP is designed as a standalone resource.
-- No ESX/QBCore dependency.
--========================================================--


ASP = ASP or {}

ASP.Server = ASP.Server or {}



--========================================================--
-- SERVER STATE
--========================================================--

ASP.Server.State = {

    Active = false,

    Players = {}

}



--========================================================--
-- INITIALIZATION
--========================================================--

---Starts the server portion of ASP.
function ASP.Server.Initialize()

    ASP.Utils.Debug(
        "Initializing AirSupportPro server"
    )


    ASP.Server.State.Active = true


    ASP.Utils.Debug(
        "AirSupportPro server initialized"
    )

end



--========================================================--
-- PLAYER MANAGEMENT
--========================================================--

AddEventHandler(
    "playerJoining",
    function()

        local source =
            source


        ASP.Server.State.Players[source] = {

            Joined = os.time(),

            Authorized = false

        }


        ASP.Utils.Debug(
            "Player registered: "
            .. tostring(source)
        )

    end
)



AddEventHandler(
    "playerDropped",
    function()

        local source =
            source


        ASP.Server.State.Players[source] = nil


        ASP.Utils.Debug(
            "Player removed: "
            .. tostring(source)
        )

    end
)



--========================================================--
-- ACE PERMISSION SYSTEM
--========================================================--

---Checks if a player has ASP permission.
---@param player number
---@return boolean
function ASP.Server.HasPermission(player)

    if not Config.Permissions.Enabled then

        return true

    end



    return IsPlayerAceAllowed(
        player,
        Config.Permissions.ACEPermission
    )

end



RegisterNetEvent(
    "AirSupportPro:CheckPermission",
    function()

        local source =
            source


        local allowed =
            ASP.Server.HasPermission(
                source
            )


        TriggerClientEvent(
            "AirSupportPro:PermissionResult",
            source,
            allowed
        )

    end
)



--========================================================--
-- SERVER EXPORTS
--========================================================--

exports(
    "IsPlayerAuthorized",
    function(player)

        return ASP.Server.HasPermission(
            player
        )

    end
)



--========================================================--
-- RESOURCE EVENTS
--========================================================--

AddEventHandler(
    "onResourceStart",
    function(resource)

        if resource ~= GetCurrentResourceName() then
            return
        end


        ASP.Server.Initialize()

    end
)



AddEventHandler(
    "onResourceStop",
    function(resource)

        if resource ~= GetCurrentResourceName() then
            return
        end


        ASP.Server.State.Active = false


        ASP.Utils.Debug(
            "AirSupportPro server stopped"
        )

    end
)



ASP.Utils.Debug(
    "Server controller loaded"
)
```
