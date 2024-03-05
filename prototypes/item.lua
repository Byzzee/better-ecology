-- item.lua

-------------
-- Modules --                                
-------------

local ecologyModuleCategory = {
    name = "ecology",
    type = "module-category"
}

local ecologyModule = {
    name = "ecology-module",
    type = "module",
    icon = "__better-ecology__/graphics/modules/ecology-module.png",
    icon_size = 64,
    subgroup = "module",
    category = "ecology",
    order = "za",
    tier = 1,
    stack_size = 50,
    effect = {
        pollution = {bonus = -0.2},
    }
}

local ecologyModule2 = {
    name = "ecology-module-2",
    type = "module",
    icon = "__better-ecology__/graphics/modules/ecology-module-2.png",
    icon_size = 64,
    subgroup = "module",
    category = "ecology",
    order = "zb",
    tier = 2,
    stack_size = 50,
    effect = {
        pollution = {bonus = -0.3},
    }
}

local ecologyModule3 = {
    name = "ecology-module-3",
    type = "module",
    icon = "__better-ecology__/graphics/modules/ecology-module-3.png",
    icon_size = 64,
    subgroup = "module",
    category = "ecology",
    order = "zc",
    tier = 3,
    stack_size = 50,
    effect = {
        pollution = {bonus = -0.4},
    }
}

------------------
-- Wind Turbine --                                
------------------

local windTurbine = {
    name = "wind-turbine",
    type = "item",
    icon = "__better-ecology__/graphics/wind-turbine/wind-turbine-icon.png",
    icon_size = 76,
    group = "logistics",
    subgroup = "energy",
    order = "c[solar-panel]",
    place_result = "wind-turbine",
    stack_size = 50
}


data:extend{ecologyModuleCategory, ecologyModule, ecologyModule2, ecologyModule3, windTurbine}