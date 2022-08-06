TableConfig = TableConfig or {}

TableConfig.Settings = { -- Configure this to your own server settings
    -- Core
    ['CoreVersion'] = 'newqb', -- 'newqb' or 'oldqb'
    ['CoreExport'] = exports['qb-core']:GetCoreObject(), -- newqb version ONLY!
    ['CoreEvent'] = 'QBCore:GetObject', -- oldqb version ONLY!
    ['Notifications'] = {
        ['Custom'] = false, -- 'false' use QB default notifications | 'true' to enable use of Custom Notifications. (Add Custom Notifications in sv_main.lua)
    },
    -- Tables
    ['Tables'] = { -- https://forge.plebmasters.de/objects
        ['Meth'] = {
            ['Prop'] = 'v_ret_ml_tableb', -- Prop of the table
            ['ItemName'] = 'methtable', -- Item to use to place table.
            ['RewardName'] = 'meth-bag', -- Reward from finishing all stages of the table.
            ['Price'] = 20000, -- Amount table will be sold for.
            ['Account'] = 'cash', -- Money will be removed from this account ('cash' or 'bank')
            ['ForceStage1'] = false, -- Set to true if you always want to do Stage 1 before Stage 2. Default: Stage 1 will only be forced first time you are doing all stages.
        },
        ['Weed'] = {
            ['Prop'] = 'bkr_prop_weed_table_01a', -- Prop of the table
            ['ItemName'] = 'weedtable', -- Item to use to place table.
            ['RewardName'] = 'weed-bag', -- Reward from finishing all stages of the table.
            ['Price'] = 20000, -- Amount table will be sold for.
            ['Account'] = 'cash', -- Money will be removed from this account ('cash' or 'bank')
            ['ForceStage1'] = false, -- Set to true if you always want to do Stage 1 before Stage 2. Default: Stage 1 will only be forced first time you are doing all stages.
        },
        ['Coke'] = {
            ['Prop'] = 'bkr_prop_coke_table01a', -- Prop of the table
            ['ItemName'] = 'coketable', -- Item to use to place table.
            ['RewardName'] = 'coke-bag', -- Reward from finishing all stages of the table.
            ['Price'] = 20000, -- Amount table will be sold for.
            ['Account'] = 'cash', -- Money will be removed from this account ('cash' or 'bank')
            ['ForceStage1'] = false, -- Set to true if you always want to do Stage 1 before Stage 2. Default: Stage 1 will only be forced first time you are doing all stages.
        },
    }
}

TableConfig.Locales = { -- Edit this if needed
    ['General'] = {
        ['BoughtTable'] = "You bought a Table..",
        ['Prodcued'] = "You have produced the drug..",
        ['Instructions'] = "[ARROWS] Rotate [ENTER] Confirm [ESC] Cancel",
    },
    ['Error'] = {
        ['Item'] = "I think you are missing an item..",
        ['Canceled'] = "Canceled..",
        ['Explosion'] = "Oops..",
        ['Place'] = "Could not place table or you canceled..",
        ['Placing'] = "You are already placing a table..",
        ['Money'] = "You don't have enough money..",
    },
    -- Tables
    ['Meth'] = {
        ['Stage_0'] = "Placing Table..",
        ['Stage_1'] = "Preparing..",
        ['Stage_2'] = "Combining..",
        ['Stage_3'] = "Mixing with water..",
        ['Stage_4'] = "Adding solvent..",
        ['Stage_5'] = "Making ready..",
        ['Stage_6'] = "Collecting Meth..",
    },
    ['Weed'] = {
        ['Stage_0'] = "Placing Table..",
        ['Stage_1'] = "Preparing..",
        ['Stage_2'] = "Cutting..",
        ['Stage_3'] = "Spraying water..",
        ['Stage_4'] = "Weighing weed..",
        ['Stage_5'] = "Putting weed in bags..",
        ['Stage_6'] = "Collecting Weed..",
    },
    ['Coke'] = {
        ['Stage_0'] = "Placing Table..",
        ['Stage_1'] = "Preparing..",
        ['Stage_2'] = "Combining..",
        ['Stage_3'] = "Adding baking soda..",
        ['Stage_4'] = "Putting in tubes..",
        ['Stage_5'] = "Making ready..",
        ['Stage_6'] = "Collecting Coke..",
    }
}

TableConfig.Timeouts = { -- Progressbar Timeouts (In Seconds)
    ['Meth'] = {
        ['Stage_0'] = 5,
        ['Stage_1'] = 5, 
        ['Stage_2'] = 30,
        ['Stage_3'] = 25,
        ['Stage_4'] = 15, 
        ['Stage_5'] = 30,
        ['Stage_6'] = 10, 
    },
    ['Weed'] = {
        ['Stage_0'] = 5,
        ['Stage_1'] = 5, 
        ['Stage_2'] = 30,
        ['Stage_3'] = 25,
        ['Stage_4'] = 15, 
        ['Stage_5'] = 30,
        ['Stage_6'] = 10, 
    },
    ['Coke'] = {
        ['Stage_0'] = 5,
        ['Stage_1'] = 5, 
        ['Stage_2'] = 30,
        ['Stage_3'] = 25,
        ['Stage_4'] = 15, 
        ['Stage_5'] = 30,
        ['Stage_6'] = 10, 
    },
}

TableConfig.Minigames = {
    ['Meth'] = {
        ['Stage_1'] = false,
        ['Stage_2'] = false,
        ['Stage_3'] = false,
        ['Stage_4'] = false,
        ['Stage_5'] = false,
        ['Stage_6'] = false,
    },
    ['Weed'] = {
        ['Stage_1'] = false,
        ['Stage_2'] = false,
        ['Stage_3'] = false,
        ['Stage_4'] = false,
        ['Stage_5'] = false,
        ['Stage_6'] = false,
    },
    ['Coke'] = {
        ['Stage_1'] = false,
        ['Stage_2'] = false,
        ['Stage_3'] = false,
        ['Stage_4'] = false,
        ['Stage_5'] = false,
        ['Stage_6'] = false,
    },
}

TableConfig.Animations = { -- https://wiki.rage.mp/index.php?title=Scenarios - https://wiki.gtanet.work/index.php?title=Animations
    ['Meth'] = { -- Name of Type
        ['Stage_0'] = {
            ['UseScenario'] = false, -- true to use Scenario for Animation
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", -- Animation Dictionary
            ['Name'] = "loop", -- Animation Name
        },
        ['Stage_1'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_2'] = {
            ['UseScenario'] = false,
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_3'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_4'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "weapon@w_sp_jerrycan", 
            ['Name'] = "fire",
        },
        ['Stage_5'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_6'] = { 
            ['UseScenario'] = false,
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist",
            ['Name'] = "loop",
        },
    },
    ['Weed'] = {
        ['Stage_0'] = {
            ['UseScenario'] = false, -- true to use Scenario for Animation
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", -- Animation Dictionary
            ['Name'] = "loop", -- Animation Name
        },
        ['Stage_1'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_2'] = {
            ['UseScenario'] = false,
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_3'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_4'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "weapon@w_sp_jerrycan", 
            ['Name'] = "fire",
        },
        ['Stage_5'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_6'] = { 
            ['UseScenario'] = false,
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist",
            ['Name'] = "loop",
        },
    },
    ['Coke'] = {
        ['Stage_0'] = {
            ['UseScenario'] = false, -- true to use Scenario for Animation
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", -- Animation Dictionary
            ['Name'] = "loop", -- Animation Name
        },
        ['Stage_1'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist",
            ['Name'] = "loop",
        },
        ['Stage_2'] = {
            ['UseScenario'] = false,
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_3'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_4'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "weapon@w_sp_jerrycan", 
            ['Name'] = "fire",
        },
        ['Stage_5'] = {
            ['UseScenario'] = false, 
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist", 
            ['Name'] = "loop", 
        },
        ['Stage_6'] = { 
            ['UseScenario'] = false,
            ['Scenario'] = "WORLD_HUMAN_HAMMERING",
            ['Dict'] = "mp_fbi_heist",
            ['Name'] = "loop",
        },
    },
}

-- Map material hash -> material type !! (Materials the tables can ONLY be placed on. - Default Grass,..) !!
TableConfig.MaterialHashes = {
    [-461750719] = 1,
    [930824497] = 1,
    [581794674] = 2,
    [-2041329971] = 2,
    [-309121453] = 2,
    [-913351839] = 2,
    [-1885547121] = 2,
    [-1915425863] = 2,
    [-1833527165] = 2,
    [2128369009] = 2,
    [-124769592] = 2,
    [-840216541] = 2,
    [-2073312001] = 3,
    [627123000] = 3,
    [1333033863] = 4,
    [-1286696947] = 5,
    [-1942898710] = 5,
    [-1595148316] = 6,
    [435688960] = 7,
    [223086562] = 8,
    [1109728704] = 8
}