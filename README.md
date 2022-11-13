# mercy-drugtables

This script is made for the QB Framework, if you need any help please join our [discord server](https://dsc.gg/mercy-coll) for support.

## DEPENDENCY
- QB Framework

## PREVIEW
[YOUTUBE](https://www.youtube.com/watch?v=MA_XWJnGLs0)

## Table Models
```
local MethTable = {
    `v_ret_ml_tableb`,
}
exports['qb-target']:AddTargetModel(MethTable, {
    options = {
        {
            type = "client",
            event = "mc-drugtables/client/start-cooking",
            icon = "fas fa-thermometer-full",
            label = "Cook",
        },
        {
            type = "client",
            event = "mc-drugtables/client/pickup-table",
            icon = "fas fa-arrow-up",
            label = "Pickup",
        },
    },
    job = {"all"},
    distance = 1.5
})
local WeedTable = {
    `bkr_prop_weed_table_01a`,
}
exports['qb-target']:AddTargetModel(WeedTable, {
    options = {
        {
            type = "client",
            event = "mc-drugtables/client/start-cooking",
            icon = "fas fa-thermometer-full",
            label = "Cook",
        },
        {
            type = "client",
            event = "mc-drugtables/client/pickup-table",
            icon = "fas fa-arrow-up",
            label = "Pickup",
        },
    },
    job = {"all"},
    distance = 1.5
})
local CokeTable = {
    `bkr_prop_coke_table01a`,
}
exports['qb-target']:AddTargetModel(CokeTable, {
    options = {
        {
            type = "client",
            event = "mc-drugtables/client/start-cooking",
            icon = "fas fa-thermometer-full",
            label = "Cook",
        },
        {
            type = "client",
            event = "mc-drugtables/client/pickup-table",
            icon = "fas fa-arrow-up",
            label = "Pickup",
        },
    },
    job = {"all"},
    distance = 1.5
})
```

## Add data.entity to the selectTarget NUI Callback of the qb-target resource
![target](https://user-images.githubusercontent.com/40138067/201529870-19100ebb-f6b2-4e82-becb-aa88854dd30c.png)
