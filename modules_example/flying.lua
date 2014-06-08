-- The table “flying” contains the module.
local flying = {}

-- We use a table to store original positions. Note that the module becomes part
-- of all game objects' shared Lua context so we can't just store the origin in
-- a variable straight - it would be overwritten if more than one GO used this module  
flying.origins = {}

-- Crudely fly to a random position at "radius" distance from the original position
-- This function sends back a "fly_randomly_done" message when it's done.

function flying.fly_randomly(radius)
	-- Radius is 100 unless specified
	radius = radius or 100
	-- We need current object id to index the original position. Can't use "."
	local go_id = go.get_id()

	-- Store origin position if it's not already stored.
	if flying.origins[go_id] == nil then
		flying.origins[go_id] = go.get_world_position(go_id)
	end
	
	-- Figure out a random position at max distance "radius" from origin
	local rand_angle = math.random(0, 3.141592 * 2)
	local rand_radius = math.random(radius)
	local offset = vmath.rotate(vmath.quat_rotation_z(rand_angle), vmath.vector3(rand_radius, 0, 0))
	local rand_pos = flying.origins[go_id] + offset
	-- Set a random duration scaled against the radius to prevent
	-- too fast animation.
	local rand_duration = math.random(radius) / 100 + (radius / 200)

	-- Animate, then send a message back when completed
	go.animate(".", "position", go.PLAYBACK_ONCE_FORWARD, rand_pos, go.EASING_INOUTSINE, rand_duration, 0.0, 
		function ()
			msg.post("#", "fly_randomly_done")
		end)
end

return flying

