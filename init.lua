dofile_once( "data/scripts/lib/utilities.lua" )

-- Terraria Mod in Noita - Usamaki Wand
-- Phase 0: Spawns at start (to the left) and randomly in dungeons/shops

-- Spawn at player start (to the left of player)
function OnPlayerSpawned( player_entity )
	local init_check_flag = "usamaki_spawned_start"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
	GameAddFlagRun( init_check_flag )

	-- Get player position
	local x, y = EntityGetTransform( player_entity )

	-- Spawn to the LEFT of player (negative x offset)
	local spawn_x = x - 20
	local spawn_y = y + 10

	-- Check if safe
	local did_hit, hit_x, hit_y = RaytracePlatforms( x, y, spawn_x, spawn_y )

	if did_hit then
		-- If blocked, spawn closer
		spawn_x = x - 10
		spawn_y = y + 5
	end

	-- Spawn Usamaki
	local usamaki = EntityLoad( "mods/terraria_mod_in_noita/files/entities/usamaki.xml", spawn_x, spawn_y )

	if usamaki ~= nil then
		GamePrint( "Usamaki spawned!" )
	else
		GamePrint( "Failed to spawn Usamaki" )
	end
end

-- Register Usamaki to spawn in wand pools
-- This makes it appear in shops, dungeons, and wand pedestals randomly
function OnMagicNumbersAndWorldSeedInitialized()
	-- Register Usamaki to spawn at level 1+ (ID 100)
	-- 10% spawn chance handled in usamaki_spawn.lua
	RegisterSpawnFunction( 100, "mods/terraria_mod_in_noita/files/scripts/usamaki_spawn.lua" )
end
