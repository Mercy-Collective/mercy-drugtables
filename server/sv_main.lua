Core = TableConfig.Settings['CoreVersion'] == 'newqb' and TableConfig.Settings['CoreExport'] or nil
if TableConfig.Settings['CoreVersion'] == 'oldqb' then TriggerEvent(TableConfig.Settings['CoreEvent'], function(obj) Core = obj end) end
local Tables = {}

-- [ Code ] --

-- [ Events ] --

RegisterNetEvent("mc-drugtables/server/buy-table", function(Type)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if Player then
        if TableConfig.Settings['Tables'][Type] ~= nil then
            if Player.Functions.RemoveMoney(TableConfig.Settings['Tables'][Type]['Account'], TableConfig.Settings['Tables'][Type]['Price'], 'Table-Bought') then
                if Player.Functions.AddItem(TableConfig.Settings['Tables'][Type]['ItemName'], 1, 'Table-Bought') then
                    if TableConfig.Settings['Notifications']['Custom'] then
                        -- Add your Notification system here.
                    else
                        TriggerClientEvent('QBCore:Notify', src, TableConfig.Locales['General']['Bought'], 'success')
                    end
                end
            else
                if TableConfig.Settings['Notifications']['Custom'] then
                    -- Add your Notification system here.
                else
                    TriggerClientEvent('QBCore:Notify', src, TableConfig.Locales['Error']['Money'], 'error')
                end
            end
        end
    end
end)

-- [ Items ] --

Core.Functions.CreateUseableItem(TableConfig.Settings['Tables']['Meth']['ItemName'], function(source, Item)
    local Player = Core.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(Item.slot) ~= nil then
        TriggerClientEvent('mc-drugtables/client/use-table', source, "Meth")
    end
end)

Core.Functions.CreateUseableItem(TableConfig.Settings['Tables']['Weed']['ItemName'], function(source, Item)
    local Player = Core.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(Item.slot) ~= nil then
        TriggerClientEvent('mc-drugtables/client/use-table', source, "Weed")
    end
end)

Core.Functions.CreateUseableItem(TableConfig.Settings['Tables']['Coke']['ItemName'], function(source, Item)
    local Player = Core.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(Item.slot) ~= nil then
        TriggerClientEvent('mc-drugtables/client/use-table', source, "Coke")
    end
end)

-- [ Callbacks ] --

Core.Functions.CreateCallback("mc-drugtables/server/place-table", function(source, cb, pCoords, pHeading, Type)
    local TableData = {}
    TableData.id = math.random(11111111, 99999999)
    TableData.coords = pCoords
    TableData.heading = pHeading
    TableData.prepared = false
    TableData.type = Type
    table.insert(Tables, TableData)
    TriggerClientEvent('mc-drugtables/client/sync-tables', -1, Tables)
end)

Core.Functions.CreateCallback('mc-drugtables/server/break-table', function(source, cb, TableId)
    for TableKey, Table in pairs(Tables) do
        if Table.id == TableId then
            table.remove(Tables, TableKey)
        end
    end
    TriggerClientEvent('mc-drugtables/client/delete-table', -1, TableId)
 end)

Core.Functions.CreateCallback('mc-drugtables/server/return-table', function(source, cb, TableId, Type)
    local Player = Core.Functions.GetPlayer(source)
    if Player then
        if Player.Functions.AddItem(TableConfig.Settings['Tables'][Type]['ItemName'], 1, 'Picked-Up-Table') then
            for TableKey, Table in pairs(Tables) do
                if Table.id == TableId then
                    table.remove(Tables, TableKey)
                end
            end
            TriggerClientEvent('mc-drugtables/client/delete-table', -1, TableId)
        end
    end
end)

Core.Functions.CreateCallback('mc-drugtables/server/get-reward', function(source, cb, Type)
    local Player = Core.Functions.GetPlayer(source)
    if Player then
        if Player.Functions.AddItem(TableConfig.Settings['Tables'][Type]['RewardName'], 1, 'reward-table')  then
            if TableConfig.Settings['Notifications']['Custom'] then
                -- Add your Notification system here.
            else
                TriggerClientEvent('QBCore:Notify', source, TableConfig.Locales['General']['Produced'], 'success')
            end
        end
    end
end)

Core.Functions.CreateCallback("Core/remove-item", function(source, cb, ItemName, Amount, Slot)
	local Player = Core.Functions.GetPlayer(source)
	local Amount = Amount ~= nil and Amount or 1
	local Slot = Slot ~= nil and Slot or false
	if Player.Functions.RemoveItem(ItemName, Amount, Slot, true) then
		cb(true)
	else
		cb(false)
	end
end)