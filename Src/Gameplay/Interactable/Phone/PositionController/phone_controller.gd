extends Node


@onready var move_timer: Timer = $MoveTimer

var phone_current_location: Marker3D
var phone_old_location: Marker3D
var phone_locations: Dictionary
var phone: Node3D

var phone_moving: bool = false

func _ready() -> void:
	HiddenButtonManager.phone_move.connect(_move_phone)
	
func _process(delta: float) -> void:
	if phone_moving:
	
		phone.global_position = lerp(\
			phone_old_location.global_position,\
			phone_current_location.global_position,\
			 sqrt(1.0 - move_timer.time_left/move_timer.wait_time)
		)
		phone.rotation_degrees = lerp(\
			phone_old_location.rotation_degrees,\
			phone_current_location.rotation_degrees,\
			sqrt(1.0 - move_timer.time_left/move_timer.wait_time)
		)

func _move_phone(location_name: String) -> void:
	
	if location_name.to_lower() == phone_current_location.name.to_lower():
		return
		
	phone_old_location = phone_current_location
	phone_current_location = phone_locations[location_name]
		
	phone_moving = true
	move_timer.start()	


func _on_move_timer_timeout() -> void:
	phone_moving = false 
