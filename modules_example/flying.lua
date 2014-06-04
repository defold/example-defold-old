local flying = {}

function flying.setup(gameobj, diameter)
	-- original position of the GO
	flying.go = gameobj	
end


function flying.fly(gameobj)
	local pos = vmath.vector3(100, 100, 0)
	go.animate(gameobj, "position", go.PLAYBACK_ONCE_FORWARD, pos, go.EASING_INOUTSINE, 1.0, 0.0)
end

return flying

