Core = TableConfig.Settings['CoreVersion'] == 'newqb' and TableConfig.Settings['CoreExport'] or nil
if TableConfig.Settings['CoreVersion'] == 'oldqb' then 
    Citizen.CreateThread(function()
        while Core == nil do
            TriggerEvent(TableConfig.Settings['CoreEvent'], function(obj) Core = obj end)
            Citizen.Wait(0)
        end
    end)
end

-- [ Code ] --

-- [ Functions ] --

-- Essentials

function TableProgress(Title, Timeout, CanCancel, cb)
    -- Possible to change this with your progressbar.
    local Success = false
    Core.Functions.Progressbar("table_progress", Title, 1000 * Timeout, false, CanCancel, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        Success = true
        cb(Success)
    end, function() -- Cancel
        cb(Success)
    end)
end

function PlayAnimation(Type)
    local UseScenario = TableConfig.Animations[Type][CurrentStage]['UseScenario']
    if UseScenario then
        TaskStartScenarioInPlace(PlayerPedId(), TableConfig.Animations[Type][CurrentStage]['Scenario'], 0, true)
    else
        RequestAnimationDict(TableConfig.Animations[Type][CurrentStage]['Dict'])
        TaskPlayAnim(PlayerPedId(), TableConfig.Animations[Type][CurrentStage]['Dict'], TableConfig.Animations[Type][CurrentStage]['Name'], 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    end
end

function ClearAnimations(Type)
    local UseScenario = TableConfig.Animations[Type][CurrentStage]['UseScenario']
    if UseScenario then
        ClearPedTasks(PlayerPedId())
    else
        StopAnimTask(PlayerPedId(), TableConfig.Animations[Type][CurrentStage]['Dict'], TableConfig.Animations[Type][CurrentStage]['Name'], 1.0)
    end
end

function TryMinigame(Type, cb)
    local MinigameEnabled = TableConfig.Minigames[Type][CurrentStage]
    if MinigameEnabled then
        cb(true)
    else
        cb(false)
    end
end

function GoNextStage(TableId, Type)
    local StageNum = tonumber(string.match(CurrentStage, "%d+"))
    local NextStage = StageNum + 1
    TriggerStage(NextStage, TableId, Type) 
end

-- Stages

function TriggerStage(Stage, TableId, Type)
    CurrentStage = "Stage_"..Stage
    if Stage == 1 then
        local Table = getTableById(TableId)
        local TablePrepared = Table.prepared
        local ForcePrepare = TableConfig.Settings['Tables'][Type]['ForceStage1']
        if not TablePrepared or ForcePrepare then
            PlayAnimation(Type)
            TableProgress(TableConfig.Locales[Type][CurrentStage], TableConfig.Timeouts[Type][CurrentStage], false, function(Success)
                ClearAnimations(Type, UseScenario)
                TryMinigame(Type, function(Enabled)
                    if Enabled then
                        -- Add Minigame here.
                        -- Success
                        Table.prepared = true
                        GoNextStage(TableId, Type)
                        -- Fail
                        -- AddExplosion(Table.coords.x, Table.coords.y, Table.coords.z, EXPLOSION_CAR, 4.0, true, false, 20.0)
                        -- Core.Functions.TriggerCallback('mc-drugtables/server/break-table', function(result) end, TableId)
                        -- Core.Functions.Notify(TableConfig.Locales['Error']['Explosion'], "error")
                    else
                        Table.prepared = true
                        GoNextStage(TableId, Type)
                    end
                end)
            end)
        else
            GoNextStage(TableId, Type)
        end
    elseif Stage == 2 then
        PlayAnimation(Type)
        TableProgress(TableConfig.Locales[Type][CurrentStage], TableConfig.Timeouts[Type][CurrentStage], false, function(Success)
            ClearAnimations(Type, UseScenario)
            TryMinigame(Type, function(Enabled)
                if Enabled then
                    -- Add Minigame here.
                    -- Success
                    GoNextStage(TableId, Type)
                    -- Fail
                    -- local Table = getTableById(TableId)
                    -- AddExplosion(Table.coords.x, Table.coords.y, Table.coords.z, EXPLOSION_CAR, 4.0, true, false, 20.0)
                    -- Core.Functions.TriggerCallback('mc-drugtables/server/break-table', function(result) end, TableId)
                    -- Core.Functions.Notify(TableConfig.Locales['Error']['Explosion'], "error")
                else
                    GoNextStage(TableId, Type)
                end
            end)
        end)
    elseif Stage == 3 then
        PlayAnimation(Type)
        TableProgress(TableConfig.Locales[Type][CurrentStage], TableConfig.Timeouts[Type][CurrentStage], false, function(Success)
            ClearAnimations(Type, UseScenario)
            TryMinigame(Type, function(Enabled)
                if Enabled then
                    -- Add Minigame here.
                    -- Success
                    GoNextStage(TableId, Type)
                    -- Fail
                    -- local Table = getTableById(TableId)
                    -- AddExplosion(Table.coords.x, Table.coords.y, Table.coords.z, EXPLOSION_CAR, 4.0, true, false, 20.0)
                    -- Core.Functions.TriggerCallback('mc-drugtables/server/break-table', function(result) end, TableId)
                    -- Core.Functions.Notify(TableConfig.Locales['Error']['Explosion'], "error")
                else
                    GoNextStage(TableId, Type)
                end
            end)
        end)
    elseif Stage == 4 then
        PlayAnimation(Type)
        TableProgress(TableConfig.Locales[Type][CurrentStage], TableConfig.Timeouts[Type][CurrentStage], false, function(Success)
            ClearAnimations(Type, UseScenario)
            TryMinigame(Type, function(Enabled)
                if Enabled then
                    -- Add Minigame here.
                    -- Success
                    GoNextStage(TableId, Type)
                    -- Fail
                    -- local Table = getTableById(TableId)
                    -- AddExplosion(Table.coords.x, Table.coords.y, Table.coords.z, EXPLOSION_CAR, 4.0, true, false, 20.0)
                    -- Core.Functions.TriggerCallback('mc-drugtables/server/break-table', function(result) end, TableId)
                    -- Core.Functions.Notify(TableConfig.Locales['Error']['Explosion'], "error")
                else
                    GoNextStage(TableId, Type)
                end
            end)
        end)
    elseif Stage == 5 then
        PlayAnimation(Type)
        TableProgress(TableConfig.Locales[Type][CurrentStage], TableConfig.Timeouts[Type][CurrentStage], false, function(Success)
            ClearAnimations(Type, UseScenario)
            TryMinigame(Type, function(Enabled)
                if Enabled then
                    -- Add Minigame here.
                    -- Success
                    GoNextStage(TableId, Type)
                    -- Fail
                    -- local Table = getTableById(TableId)
                    -- AddExplosion(Table.coords.x, Table.coords.y, Table.coords.z, EXPLOSION_CAR, 4.0, true, false, 20.0)
                    -- Core.Functions.TriggerCallback('mc-drugtables/server/break-table', function(result) end, TableId)
                    -- Core.Functions.Notify(TableConfig.Locales['Error']['Explosion'], "error")
                else
                    GoNextStage(TableId, Type)
                end
            end)
        end)
    elseif Stage == 6 then
        PlayAnimation(Type)
        TableProgress(TableConfig.Locales[Type][CurrentStage], TableConfig.Timeouts[Type][CurrentStage], false, function(Success)
            ClearAnimations(Type)
            TryMinigame(Type, function(Enabled)
                if Enabled then
                    -- Add Minigame here.
                    -- Success
                    CurrentStage = nil
                    Core.Functions.TriggerCallback('mc-drugtables/server/get-reward', function(result) end, Type)    
                    -- Fail
                    -- local Table = getTableById(TableId)
                    -- AddExplosion(Table.coords.x, Table.coords.y, Table.coords.z, EXPLOSION_CAR, 4.0, true, false, 20.0)
                    -- Core.Functions.TriggerCallback('mc-drugtables/server/break-table', function(result) end, TableId)
                    -- Core.Functions.Notify(TableConfig.Locales['Error']['Explosion'], "error")
                else
                    CurrentStage = nil
                    Core.Functions.TriggerCallback('mc-drugtables/server/get-reward', function(result) end, Type)
                end
            end)
        end)
    end
end

-- [ Events ] --

RegisterNetEvent("mc-drugtables/client/use-table", function(Type)
    if not IsPlacing then
        Core.Functions.Notify(TableConfig.Locales['General']['Instructions'], 'info', 5000)
        PlaceObject(TableConfig.Settings['Tables'][Type]['Prop'], function(pPlaced, pCoords, pHeading)
            if pPlaced then
                CurrentStage = "Stage_0"
                PlayAnimation(Type)
                TableProgress(TableConfig.Locales[Type][CurrentStage], TableConfig.Timeouts[Type][CurrentStage], true, function(Success)
                    ClearPedTasks(PlayerPedId())
                    if Success then
                        Core.Functions.TriggerCallback('Core/remove-item', function(DidRemove)
                            if DidRemove then
                                Core.Functions.TriggerCallback('mc-drugtables/server/place-table', function(result) end, pCoords, pHeading, Type)
                            else
                                Core.Functions.Notify(TableConfig.Locales['Error']['Item'], "error")
                            end
                        end, TableConfig.Settings['Tables'][Type]['ItemName'], 1, false)
                    else
                        Core.Functions.Notify(TableConfig.Locales['Error']['Canceled'], 'error')
                    end
                end)
            else
                Core.Functions.Notify(TableConfig.Locales['Error']['Place'], 'error')
            end
            IsPlacing = false
        end)
    else
        Core.Functions.Notify(TableConfig.Locales['Error']['Placing'], 'error')
    end
end)

-- TableEntity is important. It needs to get the entity of the table. (Using Target Eye on Table)
-- Example below is using the Example in README.md
-- If you need help we give support on our Discord. https://dsc.gg/mercy-coll
RegisterNetEvent("mc-drugtables/client/start-cooking", function(CanBeRemoved, TableEntity) -- "CanBeRemoved" could be Removed if TableEntity is first event parameter and not second.
    local TableId = getTableId(TableEntity['Entity']) -- ['Entity'] Can be removed when not needed
    if not TableId then return end
    local Table = getTableById(TableId)
    TriggerStage(1, TableId, Table.type)
end)

-- TableEntity is important. It needs to get the entity of the table. (Using Target Eye on Table)
-- Example below is using the Example in README.md
-- If you need help we give support on our Discord. https://dsc.gg/mercy-coll
RegisterNetEvent("mc-drugtables/client/pickup-table", function(CanBeRemoved, TableEntity) -- "CanBeRemoved" could be Removed if TableEntity is first event parameter and not second.
    local TableId = getTableId(TableEntity['Entity']) -- ['Entity'] Can be removed when not needed
    if not TableId then return end
    local Table = getTableById(TableId)
    Core.Functions.TriggerCallback('mc-drugtables/server/return-table', function(result) end, TableId, Table.type)
end)