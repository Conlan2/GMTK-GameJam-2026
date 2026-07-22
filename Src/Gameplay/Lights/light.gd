extends SpotLight3D


const FLICKER_STRENGTH: float = 0.2

func _process(delta: float) -> void:
	light_energy = 1.0 + FLICKER_STRENGTH * sin(Time.get_ticks_msec())
