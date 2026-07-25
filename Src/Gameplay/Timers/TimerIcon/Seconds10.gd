extends TimerIcon

func _process(delta: float) -> void:
	if !RadarManager.active_incoming:
		timer_world.text = "0"
		
	else:
		timer_world.text = str(\
		int(floor((RadarManager.impact_time_left-1)/10))\
		)
