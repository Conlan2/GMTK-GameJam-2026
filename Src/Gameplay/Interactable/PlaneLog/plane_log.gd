extends Node3D



var at_desk: bool = true

var moving: bool = false

@export var position_1: Vector3 = Vector3(0,0,0)
@export var position_2: Vector3 = Vector3(0,0,0)
@export var angle_1: Vector3 = Vector3(0,0,0)
@export var angle_2: Vector3 = Vector3(0,0,0)

@onready var movement_timer: Timer = $MovementTimer

func _ready() -> void:
	HiddenButtonManager.remove_plane_log.connect(_move_pos_1)
	HiddenButtonManager.move_plane_log.connect(_move_pos_2)
	
func _process(delta: float) -> void:
	if moving:
		if at_desk:
			position = lerp(\
				position_2,\
				position_1,\
				 sqrt(1.0 - movement_timer.time_left/movement_timer.wait_time)
			)
			rotation_degrees = lerp(\
				angle_2,\
				angle_1,\
				sqrt(1.0 - movement_timer.time_left/movement_timer.wait_time)
			)
		else:
			position = lerp(\
				position_1,\
				position_2,\
				 sqrt(1.0 - movement_timer.time_left/movement_timer.wait_time)
			)
			rotation_degrees = lerp(\
				angle_1,\
				angle_2,\
				sqrt(1.0 - movement_timer.time_left/movement_timer.wait_time)
			)

	
	
func _move_pos_1() -> void:
	moving = true
	at_desk = true
	movement_timer.start()

	
func _move_pos_2() -> void:
	moving = true
	at_desk = false
	movement_timer.start()
	


func _on_movement_timer_timeout() -> void:
	moving = false
