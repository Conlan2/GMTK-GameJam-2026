extends TimerIcon

func _process(delta: float) -> void:
	if !RadarManager.active_incoming:
		timer_world.text = "0"
		
	else:
		var time_left: float = RadarManager.impact_time_left
		var mod_ten = int(floor(time_left*1000)) % 10
		
		timer_world.text = str(mod_ten)
