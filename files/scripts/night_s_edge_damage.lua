dofile("data/scripts/lib/utilities.lua")

local projectile_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(projectile_id)

-- Night's Edge damage
local damage_amount = 40
local damage_type = "NORMAL"

-- Get the entity we collided with
local hit_entity = ComponentGetValue2(GetUpdatedComponentID(), "target_entity")

if hit_entity ~= nil and hit_entity ~= projectile_id then
  -- Check if it's a valid target
  local has_tag = EntityHasTag(hit_entity, "hittable") or EntityHasTag(hit_entity, "enemy")

  if has_tag then
    -- Apply damage
    EntityInflictDamage(
      hit_entity,
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
