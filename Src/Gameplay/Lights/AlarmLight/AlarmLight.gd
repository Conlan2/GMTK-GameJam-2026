extends SpotLight3D

@export var base_light_energy = 1.0
@export var timer: Timer
var flash_on: bool = true



func _process(delta: float) -> void:
	if RadarManager.active_incoming == false:
		light_energy = 0
		timer.stop()
		
	elif timer.is_stopped():
		light_energy = 5
		timer.start()
		flash_on = true
		

func _on_timer_timeout() -> void:
	flash_on = !flash_on
	if flash_on:
		light_energy = 5
	else:
		light_energy = 0
	timer.start()
