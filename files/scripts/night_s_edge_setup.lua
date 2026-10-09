dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local ability_comp = EntityGetFirstComponent(entity_id, "AbilityComponent")

-- Usamaki Advanced Spell Loadout (10 slots)
-- Terraria Night's Edge inspired: 40 damage, dual auras, arc toward cursor, multi-hit
-- Noita approximation: Complex spell combo for melee feel and multi-hit

-- Spells fire in REVERSE order (last added fires first)

-- Slot 1: HEAVY_SHOT - Damage boost (base damage increase)
AddGunAction(entity_id, "HEAVY_SHOT")

-- Slot 2: AIMING_ARC - Follows cursor (Terraria's arc toward cursor)
AddGunAction(entity_id, "AIMING_ARC")

-- Slot 3: HEAVY_SPREAD - Wider coverage (mimics Terraria's dual auras)
AddGunAction(entity_id, "HEAVY_SPREAD")

-- Slot 4: LUMINOUS_DRILL - Beam effect for energy wave (Terraria's projectile extension)
AddGunAction(entity_id, "LUMINOUS_DRILL")

-- Slot 5: CHAINSAW - Primary melee slice damage (actual sword swing)
AddGunAction(entity_id, "CHAINSAW")

-- Slot 6: CHAINSAW - Second Chainsaw for multi-hit (dual auras)
AddGunAction(entity_id, "CHAINSAW")

-- Slot 7: CHAINSAW - Third Chainsaw for rapid-fire and more damage
AddGunAction(entity_id, "CHAINSAW")

-- Slot 8: REDUCE_RECHARGE_TIME - Faster attack rate (Terraria's fast use time)
AddGunAction(entity_id, "REDUCE_RECHARGE_TIME")

-- Slot 9: ADD_MANA - Sustain mana for the complex loadout
AddGunAction(entity_id, "ADD_MANA")

-- Slot 10: DOUBLE_SPELL - Cast two spells simultaneously (aura duplication)
AddGunAction(entity_id, "DOUBLE_SPELL")

-- Configure wand for advanced performance
ComponentObjectSetValue(ability_comp, "gun_config", "reload_time", 20)
ComponentObjectSetValue(ability_comp, "gun_config", "actions_per_round", 1)
ComponentObjectSetValue(ability_comp, "gun_config", "shuffle_deck_when_empty", 0)

-- Configure attack behavior
ComponentObjectSetValue(ability_comp, "gunaction_config", "fire_rate_wait", 25)
ComponentObjectSetValue(ability_comp, "gunaction_config", "spread_degrees", 15)  -- Wider spread for arc coverage
ComponentObjectSetValue(ability_comp, "gunaction_config", "speed_multiplier", 1.5)

-- Set high mana for complex loadout
ComponentSetValue(ability_comp, "mana_max", 400)
ComponentSetValue(ability_comp, "mana_charge_speed", 200)
ComponentSetValue(ability_comp, "mana", 400)
