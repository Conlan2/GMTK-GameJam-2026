extends RadarObject


@export var alm_packed: PackedScene



func _on_timer_timeout() -> void:
	_launch_missile()
	_launch_missile()

func _launch_missile():
	var new_missile: RadarObject = alm_packed.instantiate()
	new_missile.position = position
	get_parent().add_child(new_missile)
