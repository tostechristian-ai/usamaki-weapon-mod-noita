dofile_once( "data/scripts/lib/utilities.lua" )

-- Usamaki spawn function
-- Called by RegisterSpawnFunction to determine if Usamaki should spawn at a location

function spawn_item( x, y )
	-- 10% chance to spawn Usamaki at wand locations
	if Random( 1, 10 ) == 1 then
		EntityLoad( "mods/terraria_mod_in_noita/files/entities/usamaki.xml", x, y )
	end
end
