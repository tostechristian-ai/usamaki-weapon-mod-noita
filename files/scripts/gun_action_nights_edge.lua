-- Night's Edge custom action - Simplified single projectile
-- Fires one projectile that mimics the sword swing

table.insert(actions,
  {
    id                 = "NIGHTS_EDGE",
    name               = "Night's Edge",
    description        = "A powerful sword slash",
    sprite             = "mods/terraria_mod_in_noita/files/items_gfx/night_s_edge.xml",
    type               = ACTION_TYPE_PROJECTILE,
    spawn_level        = "0,0,0,0,0,0",
    spawn_probability  = "0,0,0,0,0,0",
    price              = 0,
    mana               = 0,
    max_uses           = -1,
    custom_xml_file    = "mods/terraria_mod_in_noita/files/entities/night_s_edge_projectile.xml",
    action = function()
      add_projectile("mods/terraria_mod_in_noita/files/entities/night_s_edge_projectile.xml")
    end,
  }
)
