extends Node2D



var lock_state: bool = false

func _ready() -> void:
	HiddenButtonManager.set_radar_lock.connect(_set_visible)
	
func _set_visible():
	lock_state = !lock_state
	visible = lock_state
