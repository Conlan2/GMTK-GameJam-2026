extends TimerIcon

func _process(delta: float) -> void:
	if NuclearWarManager.war_timer.is_stopped():
		timer_world.text = "0"
		
	else:
		timer_world.text = str(\
		int(floor(NuclearWarManager.war_timer.time_left/10))\
		)
