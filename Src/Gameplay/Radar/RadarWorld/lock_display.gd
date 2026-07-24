extends Node2D


@onready var lock_label: Label = $Label2

var lock_angle = 0

var lock_state: bool = false

func _ready() -> void:
	HiddenButtonManager.set_radar_lock.connect(_set_visible)
	
func _process(delta: float) -> void:
	var local= round(RadarManager.detection_object.radar_lock_angle)
	if local < 0:
		local += 360
		
	if local > 360:
		local -= 360
	lock_label.text = str(local)
func _set_visible():
	lock_state = !lock_state
	visible = lock_state
	
	
