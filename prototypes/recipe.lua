-- recipe.lua


-------------
-- Modules --                                
-------------

local ecologyModuleRecipe = {
    type = "recipe",
    name = "ecology-module",
    enabled = false,
    energy_required = 5, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
        {type="item", name="efficiency-module", amount=1},
        {type="item", name="air-filter-clean", amount=1}
    },
    results = {
        {type="item", name="ecology-module", amount=1}
    }
}

local ecologyModule2Recipe = {
    type = "recipe",
    name = "ecology-module-2",
    enabled = false,
    energy_required = 10, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
        {type="item", name="efficiency-module-2", amount=1},
        {type="item", name="air-filter-clean", amount=2}
    },
    results = {
        {type="item", name="ecology-module-2", amount=1}
    }
}

local ecologyModule3Recipe = {
    type = "recipe",
    name = "ecology-module-3",
    enabled = false,
    energy_required = 20, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
        {type="item", name="efficiency-module-3", amount=1},
        {type="item", name="air-filter-clean", amount=5}
    },
    results = {
        {type="item", name="ecology-module-3", amount=1}
    }
}

------------------
-- Wind Turbine --                                
------------------

local windTurbine = {
    type = "recipe",
    name = "wind-turbine",
    enabled = false,
    energy_required = 20, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
        {type="item", name="copper-cable", amount=5},
        {type="item", name="plastic-bar", amount=15},
        {type="item", name="steel-plate", amount=15}
    },
    results = {
        {type="item", name="wind-turbine", amount=1}
    }
}

------------------
-- Air Purifier --                                
------------------

local airPurifier = {
    type = "recipe",
    name = "air-purifier",
    enabled = false,
    energy_required = 10, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
        {type="item", name="electronic-circuit", amount=5},
        {type="item", name="iron-gear-wheel", amount=5},
        {type="item", name="steel-plate", amount=15}
    },
    results = {
        {type="item", name="air-purifier", amount=1}
    }
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
    ingredients = {
        {type="item", name="iron-plate", amount=5},
        {type="item", name="coal", amount=5}
    },
    results = {
        {type="item", name="air-filter-clean", amount=1}
    }
}

local airFilterDirty = {
    type = "recipe",
    name = "air-filter-dirty",
    category = "air-filtering",
    hidden_from_player_crafting = true,
    enabled = false,
    energy_required = 240, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
        {type="item", name="air-filter-clean", amount=1}
    },
    results = {
        {type="item", name="air-filter-dirty", amount=1}
    }
}

local airFilterCleaned = {
    type = "recipe",
    name = "air-filter-cleaned",
    hidden_from_player_crafting = true,
    enabled = false,
    energy_required = 115, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
        {type="item", name="air-filter-dirty", amount=1}
    },
    results = {
        {type="item", name="air-filter-clean", amount=1}
    }
}

------------------
-- Tree Planter --
------------------

local treePlanter = {
    type = "recipe",
    name = "tree-planter",
    enabled = false,
    energy_required = 10, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
        {type="item", name="inserter", amount=2},
        {type="item", name="barrel", amount=10},
        {type="item", name="iron-plate", amount=20}
    },
    results = {
        {type="item", name="tree-planter", amount=1}
    }
}

local treePlantingCategory = {
    type = "recipe-category",
    name = "tree-planting"
}

local plantedTree = {
    type = "recipe",
    name = "planted-tree",
    category = "tree-planting",
    enabled = true,
    hidden = true,
    energy_required = 30, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
        {type="fluid", name="water", amount=100}
    },
    results = {
        {type="item", name="planted-tree", amount=1}
    }
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
    airFilterCleaned,
    treePlanter,
    treePlantingCategory,
    plantedTree
}