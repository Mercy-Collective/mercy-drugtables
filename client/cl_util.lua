IsPlacing, Object, ObjectCoords = false, nil, nil
Tables, ActiveTables = {}, {}
CurrentStage = nil

-- [ Code ] --

-- [ Threads ] --

Citizen.CreateThread(function()
    while true do
        local PlayerCoords = GetEntityCoords(PlayerPedId())
        if Tables == nil then Tables = {} end
        for idx, table in ipairs(Tables) do
            if idx % 100 == 0 then
                Citizen.Wait(0)
            end
            if #(PlayerCoords - table.coords) < 50.0 then
                if not ActiveTables[table.id] then
                    local curTable = createTableAtCoords(table.coords, table.heading, table.type)
                    ActiveTables[table.id] = {
                        object = curTable
                    }
                end
            else
                removeTable(table.id)
            end
        end
        Citizen.Wait(2000)
    end
end)

-- [ Functions ] --

function PlaceObject(pObject, cb)
    local objectHash, playerPed = GetHashKey(pObject), PlayerPedId()
    local minV, maxV = GetModelDimensions(objectHash)
    
    local objectHeading = GetEntityHeading(playerPed)
    local ObjectCoords = centerCoords

    Object = CreateObject(objectHash, centerCoords, 0, 0, 0)
    SetEntityCollision(Object, false)
    RequestModelHash(objectHash)

    local placed = false
    local isInvisible = false
    local canPlace = false

    IsPlacing = true

    CreateThread(function()
        while IsPlacing do
            local centerCoords = GetEntityCoords(playerPed) + (GetEntityForwardVector(playerPed) * 1.5)

            DisablePlayerFiring(PlayerPedId(), true)
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 142, true) -- MeleeAttackAlternate
            DisableControlAction(1, 38, true) --Key: E
            DisableControlAction(0, 44, true) --Key: Q

            if IsDisabledControlJustPressed(0, 177) then -- Escape
                stopPlacing()
            end

            if IsDisabledControlJustPressed(0, 174) then -- Right arrow key
                objectHeading = objectHeading + 5
                if objectHeading > 360 then objectHeading = 0.0 end
            end

            if IsDisabledControlJustPressed(0, 175) then
                objectHeading = objectHeading - 5 -- Left arrow key
                if objectHeading < 0 then objectHeading = 360.0 end
            end

            SetEntityCoords(Object, centerCoords.x, centerCoords.y, centerCoords.z, 0.0, 0.0, 0.0, false)
            PlaceObjectOnGroundProperly_2(Object)
            SetEntityHeading(Object, objectHeading)

            local rayHandle = StartShapeTestBox(centerCoords, maxV - minV, GetEntityRotation(playerPed, 2), 2, 339, playerPed, 4)
            local retval, hit, endCoords, _, materialHash, _ = GetShapeTestResultIncludingMaterial(rayHandle)
            if hit == 1 then
                canPlace = false
                if not isInvisible then
                    SetObjectVisibilityState(Object, true, function(pState)
                        isInvisible = pState
                    end)
                end
            else
                local rayHandle = StartExpensiveSynchronousShapeTestLosProbe(centerCoords.x, centerCoords.y, centerCoords.z, centerCoords.x, centerCoords.y, centerCoords.z - 2, 1, 0, 4)
                local retval, hit, endCoords, _, materialHash, _ = GetShapeTestResultIncludingMaterial(rayHandle)
                local properMaterial = TableConfig.MaterialHashes[materialHash]
                canPlace = properMaterial
                if properMaterial and isInvisible then
                    SetObjectVisibilityState(Object, false, function(pState)
                        isInvisible = pState
                    end)
                elseif not properMaterial and not isInvisible then
                    SetObjectVisibilityState(Object, true, function(pState)
                        isInvisible = pState
                    end)
                end
            end

            if canPlace and IsControlJustPressed(0, 191) then -- Enter
                ObjectCoords = GetEntityCoords(Object)
                objectHeading = GetEntityHeading(Object)
                IsPlacing = false
                placed = true
                if Object then
                    DeleteObject(Object)
                end
            end
            Wait(0)
        end
        cb(placed, ObjectCoords, objectHeading)
    end)
end

function stopPlacing()
    if Object then
        DeleteObject(Object)
    end
    IsPlacing = false
    placed = false
end

function SetObjectVisibilityState(pObject, pState, cb)
    if pState then
        SetEntityAlpha(pObject, 0, true)
    else
        ResetEntityAlpha(pObject)
    end
    cb(pState)
end

function RequestModelHash(Model)
    RequestModel(Model)
    while not HasModelLoaded(Model) do
        Wait(1)
    end
end

function RequestAnimationDict(AnimDict)
    RequestAnimDict(AnimDict)
    while not HasAnimDictLoaded(AnimDict) do
        Citizen.Wait(1)
    end
end

function createTableAtCoords(pCoords, pHeading, Type)
    local Model = GetHashKey(TableConfig.Settings['Tables'][Type]['Prop'])
    RequestModelHash(Model)
    local tableObject = CreateObject(Model, pCoords.x, pCoords.y, pCoords.z, 0, 0, 0)
    FreezeEntityPosition(tableObject, true)
    if not pHeading then pHeading = 0.0 end
    SetEntityHeading(tableObject, pHeading + 0.00001)
    PlaceObjectOnGroundProperly(tableObject)
    return tableObject
end

function removeTable(tableId)
    if ActiveTables[tableId] then
        DeleteObject(ActiveTables[tableId].object)
        ActiveTables[tableId] = nil
    end
end

function getTableId(pEntity)
    for tableId, table in pairs(ActiveTables) do
        if table.object == pEntity then
            return tableId
        end
    end
end

function getTableById(pTableId)
    for _, table in pairs(Tables) do
        if table.id == pTableId then
            return table
        end
    end
end

-- [ Handlers ] --

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    if Object then DeleteObject(Object) end
    for idx, table in pairs(ActiveTables) do
        DeleteObject(table.object)
    end
end)

-- [ Events ] --

RegisterNetEvent("mc-drugtables/client/sync-tables", function(TableData)
    Tables = TableData
end)

RegisterNetEvent("mc-drugtables/client/delete-table", function(TableId)
    for idx, Table in ipairs(Tables) do
        if Table.id == TableId then
            table.remove(Tables, idx)
            removeTable(Table.id)
            break
        end
    end
end)

