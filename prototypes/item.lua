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
        pollution = -0.2,
        consumption = -0.3
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
        pollution = -0.3,
        consumption = -0.4
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
        pollution = -0.4,
        consumption = -0.5
    }
}

------------------
-- Wind Turbine --                                
------------------

local windTurbine = {
    name = "wind-turbine",
    type = "item",
    icon = "__better-ecology__/graphics/wind-turbine/wind-turbine-icon.png",
    icon_size = 128,
    group = "production",
    subgroup = "energy",
    order = "c[solar-panel]",
    place_result = "wind-turbine",
    stack_size = 50
}

------------------
-- Air Purifier --                                
------------------

local airPurifier = {
    name = "air-purifier",
    type = "item",
    icon = "__better-ecology__/graphics/air-purifier/air-purifier-icon.png",
    icon_size = 64,
    group = "production",
    subgroup = "production-machine",
    order = "a[air-purifier]",
    place_result = "air-purifier",
    stack_size = 50
}

-----------------
-- Air Filters --                                
-----------------

local airFilterClean = {
    name = "air-filter-clean",
    type = "item",
    icon = "__better-ecology__/graphics/air-filter/air-filter-clean.png",
    icon_size = 64,
    group = "production",
    subgroup = "production-machine",
    order = "a[air-purifier]",
    stack_size = 50
}

local airFilterDirty = {
    name = "air-filter-dirty",
    type = "item",
    icon = "__better-ecology__/graphics/air-filter/air-filter-dirty.png",
    icon_size = 64,
    group = "production",
    subgroup = "production-machine",
    order = "a[air-purifier]",
    stack_size = 50
}

------------------
-- Tree Planter --
------------------

local treePlanter = {
    name = "tree-planter",
    type = "item",
    icon = "__better-ecology__/graphics/tree-planter/tree-planter-icon.png",
    icon_size = 192,
    group = "production",
    subgroup = "energy",
    order = "z[solar-panel]",
    place_result = "tree-planter",
    stack_size = 50
}

local plantedTree = {
    name = "planted-tree",
    type = "item",
    icon = "__better-ecology__/graphics/tree-planter/tree-icon.png",
    icon_size = 256,
    stack_size = 2
}


data:extend{
    ecologyModuleCategory, 
    ecologyModule, 
    ecologyModule2, 
    ecologyModule3, 
    windTurbine, 
    airPurifier, 
    airFilterClean, 
    airFilterDirty,
    treePlanter,
    plantedTree
}