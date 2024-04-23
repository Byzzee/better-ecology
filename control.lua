-- Первый запуск
script.on_init(function()
    -- Инициализация
    global.tree_planters = {}
end)

-- Загрузка из сохранения
script.on_load(function()
--     if global.tree_planters == nil then
--         global.tree_planters = {}
--     end
end)

-- ДА, ТЫ ВСЁ ПРАВИЛЬНО ПОНЯЛ
-- Каждый тик я проверяю выход каждого высаживателя деревьев
script.on_event(defines.events.on_tick, function(event)
    for i, planter in ipairs(global.tree_planters) do
        local inventory = planter.get_output_inventory()
        if not inventory.is_empty() then
            inventory.clear()
            local treePosition = {
                planter.position.x + math.random(-20, 20),
                planter.position.y + math.random(-20, 20)
            }
            if planter.surface.can_place_entity({name="tree-05", position=treePosition}) then
                planter.surface.create_entity({name="tree-05", position=treePosition})
            end
        end
    end
end)

-- Обработка спавна высаживателя деревьев
local function registerTreePlanter(entity)
    entity.operable = false
    table.insert(global.tree_planters, entity)
end

script.on_event(defines.events.on_built_entity, function(event)
    registerTreePlanter(event.created_entity)
    end,
    {{filter = "name", name = "tree-planter"}}
)

script.on_event(defines.events.on_robot_built_entity, function(event)
    registerTreePlanter(event.created_entity)
    end,
    {{filter = "name", name = "tree-planter"}}
)

script.on_event(defines.events.script_raised_built, function(event)
    registerTreePlanter(event.entity)
    end,
    {{filter = "name", name = "tree-planter"}}
)

-- Обработка удаления высаживателя деревьев
local function unregisterTreePlanter(entity)
    for i, planter in ipairs(global.tree_planters) do
        if planter == entity then
            table.remove(global.tree_planters, i)
            break
        end
    end
end

script.on_event(defines.events.on_entity_died, function(event)
    unregisterTreePlanter(event.entity)
    end,
    {{filter = "name", name = "tree-planter"}}
)

script.on_event(defines.events.on_player_mined_entity, function(event)
    unregisterTreePlanter(event.entity)
    end,
    {{filter = "name", name = "tree-planter"}}
)

script.on_event(defines.events.on_robot_mined_entity, function(event)
    unregisterTreePlanter(event.entity)
    end,
    {{filter = "name", name = "tree-planter"}}
)
