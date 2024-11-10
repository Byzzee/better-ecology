-- Первый запуск
script.on_init(function()
    -- Инициализация глобальных переменных
    storage.tree_planters = {}
    storage.air_purifiers = {}
    storage.wind_turbines = {}
    storage.wind_speed = 500 -- 30kW
end)

-- Первый запуск после изменения конфигурации
script.on_configuration_changed(function()
    -- Инициализация недостающих глобальных переменных
    storage.tree_planters = storage.tree_planters or {}
    storage.air_purifiers = storage.air_purifiers or {}
    storage.wind_turbines = storage.wind_turbines or {}
    storage.wind_speed = storage.wind_speed or 500
end)

-- TODO: Добавить логику очищения клеток, соседних с очистителем воздуха

script.on_event(defines.events.on_tick, function(event)
    -- ДА, ТЫ ВСЁ ПРАВИЛЬНО ПОНЯЛ
    -- Каждый тик я проверяю выход каждого высаживателя деревьев
    for _, planter in ipairs(storage.tree_planters) do
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
    -- Каждые пол секунды (30 тиков)
    if event.tick % 30 == 0 then
        -- Изменение скорости ветра
        if #storage.wind_turbines ~= 0 then
            local deltaSpeed = math.random(-1, 1) * math.random() * 20
            -- Производство энергии в диапазоне от 18 до 42 кВт
            if storage.wind_speed + deltaSpeed > 300 and storage.wind_speed + deltaSpeed < 700 then
                storage.wind_speed = storage.wind_speed + deltaSpeed
            end
            for _, turbine in ipairs(storage.wind_turbines) do
                turbine.power_production = storage.wind_speed -- 100 = 6kW
            end
        end
        -- Очистка воздуха
        for _, purifier in ipairs(storage.air_purifiers) do
            if purifier.is_crafting() then
                -- 32 на 32 - это один игровой чанк
                -- получается один очиститель суммарно очищает квадрат из 9 чанков
                for x = -32, 32, 32 do
                    for y = -32, 32, 32 do
                        local position = {x = purifier.position.x + x, y = purifier.position.y + y}
                        purifier.surface.pollute(position, -100)
                    end
                end
            end
        end
    end
end)

-- Обработка спавна построек
local function registerModEntity(entity)
    if entity.name == "tree-planter" then
        entity.operable = false
        table.insert(storage.tree_planters, entity)
    elseif entity.name == "air-purifier" then
        table.insert(storage.air_purifiers, entity)
    elseif entity.name == "wind-turbine" then
        table.insert(storage.wind_turbines, entity)
    end
end

script.on_event(defines.events.on_built_entity, function(event)
    registerModEntity(event.entity) end, {
        {filter = "name", name = "tree-planter"},
        {filter = "name", name = "air-purifier", mode = "or"},
        {filter = "name", name = "wind-turbine", mode = "or"}
    }
)

script.on_event(defines.events.on_robot_built_entity, function(event)
    registerModEntity(event.entity) end, {
        {filter = "name", name = "tree-planter"},
        {filter = "name", name = "air-purifier", mode = "or"},
        {filter = "name", name = "wind-turbine", mode = "or"}
    }
)

script.on_event(defines.events.script_raised_built, function(event)
    registerModEntity(event.entity) end, {
        {filter = "name", name = "tree-planter"},
        {filter = "name", name = "air-purifier", mode = "or"},
        {filter = "name", name = "wind-turbine", mode = "or"}
    }
)

script.on_event(defines.events.script_raised_revive, function(event)
    registerModEntity(event.entity) end, {
        {filter = "name", name = "tree-planter"},
        {filter = "name", name = "air-purifier", mode = "or"},
        {filter = "name", name = "wind-turbine", mode = "or"}
    }
)

-- Обработка удаления построек
local function unregisterModEntity(entity)
    local entityGroup
    if entity.name == "tree-planter" then
        entityGroup = "tree_planters"
    elseif entity.name == "air-purifier" then
        entityGroup = "air_purifiers"
    elseif entity.name == "wind-turbine" then
        entityGroup = "wind_turbines"
    end
    for i, e in ipairs(storage[entityGroup]) do
        if e == entity then
            table.remove(storage[entityGroup], i)
            break
        end
    end
end

script.on_event(defines.events.on_entity_died, function(event)
    unregisterModEntity(event.entity) end, {
        {filter = "name", name = "tree-planter"},
        {filter = "name", name = "air-purifier", mode = "or"},
        {filter = "name", name = "wind-turbine", mode = "or"}
    }
)

script.on_event(defines.events.on_player_mined_entity, function(event)
    unregisterModEntity(event.entity) end, {
        {filter = "name", name = "tree-planter"},
        {filter = "name", name = "air-purifier", mode = "or"},
        {filter = "name", name = "wind-turbine", mode = "or"}
    }
)

script.on_event(defines.events.on_robot_mined_entity, function(event)
    unregisterModEntity(event.entity) end, {
        {filter = "name", name = "tree-planter"},
        {filter = "name", name = "air-purifier", mode = "or"},
        {filter = "name", name = "wind-turbine", mode = "or"}
    }
)

script.on_event(defines.events.script_raised_destroy, function(event)
    unregisterModEntity(event.entity) end, {
        {filter = "name", name = "tree-planter"},
        {filter = "name", name = "air-purifier", mode = "or"},
        {filter = "name", name = "wind-turbine", mode = "or"}
    }
)