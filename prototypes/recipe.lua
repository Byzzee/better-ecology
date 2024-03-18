-- recipe.lua


-------------
-- Modules --                                
-------------

local ecologyModuleRecipe = {
    type = "recipe",
    name = "ecology-module",
    enabled = false,
    energy_required = 5, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"effectivity-module", 1}, {"air-filter-clean", 1}},
    result = "ecology-module"
}

local ecologyModule2Recipe = {
    type = "recipe",
    name = "ecology-module-2",
    enabled = false,
    energy_required = 10, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"effectivity-module-2", 1}, {"air-filter-clean", 2}},
    result = "ecology-module-2"
}

local ecologyModule3Recipe = {
    type = "recipe",
    name = "ecology-module-3",
    enabled = false,
    energy_required = 20, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"effectivity-module-3", 1}, {"air-filter-clean", 5}},
    result = "ecology-module-3"
}

------------------
-- Wind Turbine --                                
------------------

local windTurbine = {
    type = "recipe",
    name = "wind-turbine",
    enabled = false,
    energy_required = 20, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"copper-cable", 5}, {"plastic-bar", 15}, {"steel-plate", 15}},
    result = "wind-turbine"
}

------------------
-- Air Purifier --                                
------------------

local airPurifier = {
    type = "recipe",
    name = "air-purifier",
    enabled = false,
    energy_required = 10, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"electronic-circuit", 5}, {"iron-gear-wheel", 5}, {"steel-plate", 15}},
    result = "air-purifier"
}

-----------------
-- Air Filters --                                
-----------------

local airFilterCategory = {
    type = "recipe-category",
    name = "air-filtering"
}

local airFilterClean = {
    type = "recipe",
    name = "air-filter-clean",
    enabled = false,
    energy_required = 5, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"iron-plate", 5}, {"coal", 5}},
    result = "air-filter-clean"
}

local airFilterDirty = {
    type = "recipe",
    name = "air-filter-dirty",
    category = "air-filtering",
    hidden_from_player_crafting = true,
    enabled = false,
    energy_required = 120, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"air-filter-clean", 1}},
    result = "air-filter-dirty"
}

local airFilterCleaned = {
    type = "recipe",
    name = "air-filter-cleaned",
    hidden_from_player_crafting = true,
    enabled = false,
    energy_required = 115, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"air-filter-dirty", 1}},
    result = "air-filter-clean"
}


data:extend{
    ecologyModuleRecipe, 
    ecologyModule2Recipe, 
    ecologyModule3Recipe, 
    windTurbine, 
    airPurifier, 
    airFilterCategory, 
    airFilterClean, 
    airFilterDirty, 
    airFilterCleaned
}