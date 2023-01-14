function on_pipette(event)
	local player = game.players[event.player_index]
	
	if player.mod_settings["GhostPipette__enabled"].value then
		-- item is not in player inventory if cursor is empty after pipetting => put ghost into player cursor
		if player.is_cursor_empty() then
			player.cursor_ghost = event.item
			player.play_sound{
				path = "utility/smart_pipette",
				position = player.position,
			}
		end
	end
end

script.on_event(defines.events.on_player_pipette, on_pipette)
