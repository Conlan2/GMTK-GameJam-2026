extends Node2D


@onready var lock_label: Label = $Label2

var lock_angle = 0

var lock_state: bool = false

func _ready() -> void:
	HiddenButtonManager.set_radar_lock.connect(_set_visible)
	HiddenButtonManager.turn_radar_lock.connect(turn_lock)
	
func _process(delta: float) -> void:
	lock_label.text = str(round(lock_angle))
	
func turn_lock(turn_amount: float) -> void:
	lock_angle += turn_amount
	if lock_angle < 0:
		lock_angle += 360
		
	if lock_angle > 360:
		lock_angle -= 360
	
func _set_visible():
	lock_state = !lock_state
	visible = lock_state
	
	
