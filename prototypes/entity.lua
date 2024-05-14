-- entity.lua


------------
-- Sounds --                                
------------

local sounds = {
    machine_open = {
        filename = "__base__/sound/machine-open.ogg",
        volume = 0.5
    },
    machine_close = {
        filename = "__base__/sound/machine-close.ogg",
        volume = 0.5
    },
    vehicle_impact = {
        filename = "__base__/sound/car-metal-impact.ogg",
        volume = 0.5
    },
    wind_turbine_working = {
        filename = "__better-ecology__/sound/wind-turbine-working.wav",
        volume = 2.0
    },
    air_purifier_working = {
        filename = "__better-ecology__/sound/air-purifier-working.wav",
        volume = 2.0
    }
}

------------------
-- Wind Turbine --                                
------------------

local windTurbine = {
    name = "wind-turbine",
    type = "electric-energy-interface",
    icon = "__better-ecology__/graphics/wind-turbine/wind-turbine-icon.png",
    icon_size = 128,
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
    drawing_box   = {{-1.00, -4.25}, {1.00, 0.25}},
    energy_source = {
        type = "electric",
		usage_priority = "primary-output",
		buffer_capacity = "42kJ",
		output_flow_limit = "42kW",
        input_flow_limit = "0kW",
        render_no_power_icon = false,
    },
    energy_production = "30kW",
    energy_usage = "0kW",
    working_sound = {
        sound = sounds.wind_turbine_working,
        idle_sound = sounds.wind_turbine_working
    },
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
    icon_size = 64,
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
        emissions_per_minute = 0
    },
    energy_usage = "97087W", -- Чтобы в итоге ровно соточка получилась
    working_sound = sounds.air_purifier_working,
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

------------------
-- Tree Planter --
------------------

local treePlanter = {
    type = "assembling-machine",
    name = "tree-planter",
    icon = "__better-ecology__/graphics/tree-planter/tree-planter-icon.png",
    icon_size = 192,
    flags = {"player-creation", "placeable-neutral", "not-rotatable"},
    minable = {mining_time = 0.1, result = "tree-planter"},
    max_health = 100,
    corpse = "big-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    crafting_speed = 1,
    crafting_categories = {"tree-planting"},
    fixed_recipe = "planted-tree",
    ingredient_count = 1,
    fluid_boxes = {
        {
            base_area = 3,
            height = 1,
            base_level = -1,
            pipe_connections = {
                {
                    type = "input",
                    positions = {{1, 2}, {-2, 1}, {-1, -2}, {2, -1}}
                },
            },
            pipe_covers = {
                -- На самом деле не используются, потому что постройку нельзя поворачивать
                north = {
                    filename="__base__/graphics/entity/pipe-covers/hr-pipe-cover-north.png",
                    size = 128
                },
                west = {
                    filename="__base__/graphics/entity/pipe-covers/hr-pipe-cover-west.png",
                    size = 128
                },
                east = {
                    filename="__base__/graphics/entity/pipe-covers/hr-pipe-cover-east.png",
                    size = 128
                },
                -- А вот эта используется
                south = {
                    filename="__base__/graphics/entity/pipe-covers/hr-pipe-cover-south.png",
                    size = 128,
                    scale = 0.5,
                },
            },
            production_type = "input",
            filter = "water",
        }
    },
    energy_usage = "19355W",
    energy_source = {
        type = "electric",
        emissions_per_minute = 0,
        usage_priority = "secondary-input"
    },
    animation = {
        north = {
            layers = {
                {
                    filename = "__better-ecology__/graphics/tree-planter/tree-planter-north-base.png",
                    width = 179,
                    height = 208,
                    scale = 0.495,
                    frame_count = 64,
                    line_length = 8,
                    shift = util.by_pixel(4.5, -3),
                    animation_speed = 0.5
                },
                {
                    filename = "__better-ecology__/graphics/tree-planter/tree-planter-north-glow.png",
                    width = 179,
                    height = 208,
                    scale = 0.495,
                    frame_count = 64,
                    line_length = 8,
                    shift = util.by_pixel(4.5, -3),
                    animation_speed = 0.5,
                    tint = {r=1.0, g=1.0, b=0.75, a=0.25},
                    draw_as_glow = true
                },
                {
                    filename = "__better-ecology__/graphics/tree-planter/tree-planter-north-shadow.png",
                    width = 300,
                    height = 200,
                    scale = 0.495,
                    frame_count = 64,
                    line_length = 8,
                    shift = util.by_pixel(33, 15),
                    animation_speed = 0.5,
                    draw_as_shadow = true
                }
            }
        },
--         west = {
--             layers = {
--                 {
--                     filename = "__better-ecology__/graphics/tree-planter/tree-planter-west-base.png",
--                     width = 179,
--                     height = 208,
--                     scale = 0.495,
--                     frame_count = 64,
--                     line_length = 8,
--                     shift = util.by_pixel(4.5, -3)
--                 },
--                 {
--                     filename = "__better-ecology__/graphics/tree-planter/tree-planter-west-glow.png",
--                     width = 179,
--                     height = 208,
--                     scale = 0.495,
--                     frame_count = 64,
--                     line_length = 8,
--                     shift = util.by_pixel(4.5, -3),
--                     draw_as_glow = true
--                 },
--                 {
--                     filename = "__better-ecology__/graphics/tree-planter/tree-planter-west-shadow.png",
--                     width = 300,
--                     height = 200,
--                     scale = 0.495,
--                     frame_count = 64,
--                     line_length = 8,
--                     draw_as_shadow = true
--                 }
--             }
--         },
--         east = {
--             layers = {
--                 {
--                     filename = "__better-ecology__/graphics/tree-planter/tree-planter-east-base.png",
--                     width = 179,
--                     height = 208,
--                     scale = 0.495,
--                     frame_count = 64,
--                     line_length = 8,
--                     shift = util.by_pixel(4.5, -3)
--                 },
--                 {
--                     filename = "__better-ecology__/graphics/tree-planter/tree-planter-east-glow.png",
--                     width = 179,
--                     height = 208,
--                     scale = 0.495,
--                     frame_count = 64,
--                     line_length = 8,
--                     shift = util.by_pixel(4.5, -3),
--                     draw_as_glow = true
--                 },
--                 {
--                     filename = "__better-ecology__/graphics/tree-planter/tree-planter-east-shadow.png",
--                     width = 300,
--                     height = 200,
--                     scale = 0.495,
--                     frame_count = 64,
--                     line_length = 8,
--                     draw_as_shadow = true
--                 }
--             }
--         },
--         south = {
--             layers = {
--                 {
--                     filename = "__better-ecology__/graphics/tree-planter/tree-planter-south-base.png",
--                     width = 179,
--                     height = 208,
--                     scale = 0.495,
--                     frame_count = 64,
--                     line_length = 8,
--                     shift = util.by_pixel(4.5, -3)
--                 },
--                 {
--                     filename = "__better-ecology__/graphics/tree-planter/tree-planter-south-glow.png",
--                     width = 179,
--                     height = 208,
--                     scale = 0.495,
--                     frame_count = 64,
--                     line_length = 8,
--                     shift = util.by_pixel(4.5, -3),
--                     draw_as_glow = true
--                 },
--                 {
--                     filename = "__better-ecology__/graphics/tree-planter/tree-planter-south-shadow.png",
--                     width = 300,
--                     height = 200,
--                     scale = 0.495,
--                     frame_count = 64,
--                     line_length = 8,
--                     draw_as_shadow = true
--                 }
--             }
--         },
    },
}


data:extend{
    windTurbine, 
    airPurifier,
    treePlanter
}