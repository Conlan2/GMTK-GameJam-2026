extends TimerIcon

func _process(delta: float) -> void:
	if NuclearWarManager.war_timer.is_stopped():
		timer_world.text = "0"
		
	else:
		var time_left: float = NuclearWarManager.war_timer.time_left
		var raised_floor = floor(time_left*1000)
		var mod_ten = int(raised_floor) % 10
		
		timer_world.text = str(mod_ten)
