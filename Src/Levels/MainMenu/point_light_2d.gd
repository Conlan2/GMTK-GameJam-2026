extends PointLight2D

@export var base_light_energy = 1.0
@export var flicker_strength: float = 0.2
@export var flicker_interval: float = 1.0

func _process(delta: float) -> void:
	energy = base_light_energy + flicker_strength * sin(Time.get_ticks_msec() / flicker_interval)
