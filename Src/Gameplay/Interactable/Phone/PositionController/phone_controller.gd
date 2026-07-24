extends Node


@onready var move_timer: Timer = $MoveTimer

var phone_current_location: Marker3D
var phone_old_location: Marker3D
var phone_locations: Dictionary
var phone: Node3D

var phone_moving: bool = false

var conversation_queue: Array = []

signal add_conversation_to_queue(conversation: Conversation)
signal conversation_listened(conversation: Conversation)
signal conversation_finished

func _ready() -> void:
	HiddenButtonManager.phone_move.connect(_move_phone)
	add_conversation_to_queue.connect(_add_conversation)
	conversation_finished.connect(_conversation_finished)
	
func _conversation_finished() -> void:
	_move_phone("home")
	
func _add_conversation(conversation: Conversation) -> void:
	conversation_queue.append(conversation)
	
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
	
	if location_name != "ear":
		return
		
	if len(conversation_queue) <= 0:
		return
		
	var next_conversation: Conversation = conversation_queue.pop_front()
	conversation_listened.emit(next_conversation)


func _on_move_timer_timeout() -> void:
	phone_moving = false 
