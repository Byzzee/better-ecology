-- entity.lua


------------
-- Sounds --                                
------------

local sounds = {
    machine_open = {
        filename = "__base__/sound/machine-open.ogg",
        volume = 0.75
    },
    machine_close = {
        filename = "__base__/sound/machine-close.ogg",
        volume = 0.75
    },
    vehicle_impact = {
        filename = "__base__/sound/car-metal-impact.ogg",
        volume = 0.75
    }
}

------------------
-- Wind Turbine --                                
------------------

local windTurbine = {
    name = "wind-turbine",
    type = "electric-energy-interface",
    icon = "__better-ecology__/graphics/wind-turbine/wind-turbine-icon.png",
    icon_size = 32,
    localised_description = {"",
      {"entity-description.wind-turbine"},
      {"wind-turbine.generates-electricity"},
    },
    flags = {"player-creation","placeable-neutral", "not-rotatable"},
    remnants = "medium-small-remnants",
    dying_explosion = "medium-explosion",
    max_health = 200,
    minable = {mining_time = 0.5, result = "wind-turbine"},
    collision_mask = {"player-layer", "item-layer", "object-layer", "water-tile"},
	collision_box = {{-0.65, -0.65}, {0.65, 0.65}},
	selection_box = {{-0.65, -0.65}, {0.65, 0.65}},
    energy_source = {
        type = "electric",
		usage_priority = "primary-output",
		buffer_capacity = "30kJ",
		output_flow_limit = "30kW",
        input_flow_limit = "0kW",
        render_no_power_icon = false,
    },
    energy_production = "30kW",
    energy_usage = "0kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.vehicle_impact,
    continuous_animation = true,
    animation = {
        layers = {
            {
                filename = "__better-ecology__/graphics/wind-turbine/wind-turbine.png",
                width = 150,
                height = 300,
                frame_count = 64,
                line_length = 8,
                scale = 0.5,
                shift = util.by_pixel(0, -62)
            },
            {
                filename = "__better-ecology__/graphics/wind-turbine/wind-turbine-shadow.png",
                width = 370,
                height = 100,
                frame_count = 64,
                line_length = 8,
                draw_as_shadow = true,
                scale = 0.5,
                shift = util.by_pixel(82, 4)
            }
        }
    },
}

------------------
-- Air Purifier --                                
------------------

local airPurifier = {
    name = "air-purifier",
    type = "furnace",
    icon = "__better-ecology__/graphics/air-purifier/air-purifier-icon.png",
    icon_size = 32,
    flags = {"player-creation", "placeable-neutral", "not-rotatable"},
    minable = {mining_time = 0.5, result = "air-purifier"},
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.8, -0.6}, {0.8, 0.6}},
    selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
    source_inventory_size = 1,
    result_inventory_size = 1,
    crafting_speed = 2,
    crafting_categories = {"air-filtering"},
    energy_source = {
        type = "electric",
        usage_priority = "primary-input",
        buffer_capacity = "0J",
		output_flow_limit = "0W",
        input_flow_limit = "200kW",
        render_no_power_icon = false,
        emissions_per_minute = -50
    },
    energy_usage = "97087W", -- Чтобы в итоге ровно соточка получилась
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.vehicle_impact,
    animation = {
        layers = {
            {
                filename = "__better-ecology__/graphics/air-purifier/air-purifier.png",
                width = 160,
                height = 256,
                scale = 0.35,
                frame_count = 64,
                line_length = 8,
                shift = util.by_pixel(0, -25)
            },
            {
                filename = "__better-ecology__/graphics/air-purifier/air-purifier-shadow.png",
                width = 305,
                height = 158,
                scale = 0.255,
                frame_count = 64,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(64, 0)
            }
        }
    }
}


data:extend{
    windTurbine, 
    airPurifier
}