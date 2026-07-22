extends Node

@export var move_timer: Timer

var camera: Camera3D = null
var camera_positions: Dictionary = {}
var old_position: CameraSpawner = null
var current_position: CameraSpawner = null


var camera_moving: bool = false

signal add_camera(new_camera: Camera3D)

func _ready() -> void:
	add_camera.connect(_add_camera)
	
func _add_camera(new_camera: Camera3D):
	camera = new_camera
	
func _process(delta: float) -> void:
	if !is_instance_valid(camera):
		return
	
	if camera_moving:
		camera.global_position = lerp(\
			old_position.global_position,\
			current_position.global_position,\
			 sqrt(1.0 - move_timer.time_left/move_timer.wait_time)
		)
		camera.rotation_degrees = lerp(\
			old_position.rotation_degrees,\
			current_position.rotation_degrees,\
			sqrt(1.0 - move_timer.time_left/move_timer.wait_time)
		)
	
func change_camera_position(new_position_name: String) -> void:
	if camera_moving:
		return
	
	if new_position_name not in camera_positions.keys():
		return
		
	if current_position.position_name == new_position_name:
		return
		
	old_position = current_position
	current_position = camera_positions[new_position_name]
	move_timer.start()
	camera_moving = true

func _on_move_timer_timeout() -> void:
	camera_moving = false
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("turn_right"):
		change_camera_position(current_position.right_pos_name)
		
	if event.is_action_pressed("turn_left"):
		change_camera_position(current_position.left_pos_name)
