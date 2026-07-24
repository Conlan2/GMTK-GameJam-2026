extends TimerIcon

func _process(delta: float) -> void:
	if NuclearWarManager.war_timer.is_stopped():
		timer_world.text = "0"
		
	else:
		var time_left: float = NuclearWarManager.war_timer.time_left
		var mod_ten = int(floor(time_left)) % 10
		
		timer_world.text = str(mod_ten)
