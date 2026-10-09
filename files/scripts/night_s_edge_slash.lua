dofile("data/scripts/lib/utilities.lua")

local projectile_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(projectile_id)

-- Night's Edge slash damage logic
-- This projectile acts as a melee hitbox

-- Damage configuration
local damage_amount = 40
local damage_type = "NORMAL"

-- Find entities in melee range
local entities = EntityGetInRadius(x, y, 30)

if entities ~= nil then
  for i, entity_id in ipairs(entities) do
    -- Don't damage the shooter or the projectile itself
    if entity_id ~= projectile_id then
      -- Check if it's a valid target (enemy)
      local has_tag = EntityHasTag(entity_id, "hittable") or EntityHasTag(entity_id, "enemy")

      if has_tag then
        -- Apply damage
        EntityInflictDamage(
          entity_id,
          damage_amount,
          damage_type,
          "Night's Edge",
          "DIRT",
          0,
          0,
          projectile_id,
          x,
          y,
          10
        )
      end
    end
  end
end

-- Kill the projectile after one hit
EntityKill(projectile_id)
