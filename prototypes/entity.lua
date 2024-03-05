-- entity.lua

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
        filename = "__base__/sound/generic-impact.ogg",
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
    icon_size = 76,
    localised_description = {"",
      {"entity-description.wind-turbine"},
      {"wind-turbine.generates-electricity"},
    },
    flags = {"player-creation","placeable-neutral", "not-rotatable"},
    remnants = "medium-small-remnants",
    max_health = 200,
    minable = {mining_time = 0.5, result = 'wind-turbine'},
    collision_mask = {"player-layer", "item-layer", "object-layer", "water-tile"},
	collision_box = {{-0.65, -0.65}, {0.65, 0.65}},
	selection_box = {{-0.65, -0.65}, {0.65, 0.65}},
    energy_source = {
        type = "electric",
		render_no_power_icon = false,
		usage_priority = "primary-output",
		buffer_capacity = "30KJ",
		output_flow_limit = "30KW",
        input_flow_limit = '0W',
    },
    energy_production = "30KW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    -- picture = {
    --     filename = "__better-ecology__/graphics/wind-turbine/wind-turbine-alt.png",
    --     priority = "extra-high",
    --     width = 100,
    --     height = 200,
    --     scale = 0.75,
    --     shift = util.by_pixel(0, -60)
    -- }
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
    animation_speed = 0.5
}


data:extend{windTurbine}