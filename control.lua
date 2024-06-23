local function setting_enabled(event, setting_name)
  local idx = event.player_index
  return settings.get_player_settings(idx)["build-utils-" .. setting_name].value
end

script.on_event(defines.events.on_player_main_inventory_changed,
  function(event)
    if not setting_enabled(event, "auto-swap-ghost") then
      return
    end
    local player = game.get_player(event.player_index)
    local item = player.cursor_ghost
    if player.is_cursor_empty() or item == nil then
      return
    end
    local inventory = player.get_inventory(defines.inventory.character_main)
    local item_stack = inventory.find_item_stack(item.name)
    if item_stack == nil or item_stack.count == 0 then
      return
    end
    player.cursor_stack.swap_stack(item_stack)
  end
)

script.on_event(defines.events.on_built_entity,
  function(event)
    if not setting_enabled(event, "auto-select-ghost") or event.item == nil then
      return
    end
    local player = game.get_player(event.player_index)
    if player.is_cursor_empty() then
      player.cursor_ghost = event.item
    end
  end
)
