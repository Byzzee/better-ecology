-- recipe.lua


-------------
-- Modules --                                
-------------

local ecologyModuleRecipe = {
    type = "recipe",
    name = "ecology-module",
    enabled = false,
    energy_required = 15, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"electronic-circuit", 5}, {"advanced-circuit", 5}},
    result = "ecology-module"
}

local ecologyModule2Recipe = {
    type = "recipe",
    name = "ecology-module-2",
    enabled = false,
    energy_required = 30, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"advanced-circuit", 5}, {"processing-unit", 5}, {"ecology-module", 4}},
    result = "ecology-module-2"
}

local ecologyModule3Recipe = {
    type = "recipe",
    name = "ecology-module-3",
    enabled = false,
    energy_required = 60, -- time to craft in seconds (at crafting speed 1)
    ingredients = {{"advanced-circuit", 5}, {"processing-unit", 5}, {"ecology-module-2", 5}},
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


data:extend{ecologyModuleRecipe, ecologyModule2Recipe, ecologyModule3Recipe, windTurbine}