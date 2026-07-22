extends Node
class_name BaseLevel

@export_group("Spawners")
@export var player_spawner: Marker3D
@export var camera_spawner: CameraSpawner

@export_group("Packed Scenes")
@export var Camera_Scene: PackedScene
@export var Camera_Position_Root: Node

var _camera: Camera3D = null

func _ready() -> void:
	_create_camera()

func get_default_player_spawn() -> Vector3:
	if !is_instance_valid(player_spawner):
		push_error("Player Spawner is not Valid instance")
		return Vector3(0,0,0)
	
	
	return player_spawner.global_position
	
func _create_camera() -> void:
	if !is_instance_valid(camera_spawner):
		push_error("Camera Spawner is not valid")
		return
		
	if !is_instance_valid(Camera_Scene) or !Camera_Scene.can_instantiate():
		push_error("Camera Scene Cannot be created")
		return
		
	_camera = Camera_Scene.instantiate() as Camera3D
	_camera.global_position = camera_spawner.global_position
	_camera.rotation_degrees = camera_spawner.rotation_degrees
	CameraMananger.current_position = camera_spawner

	if !is_instance_valid(_camera):
		push_error("Camera Scene Failed after creation")
		return		
		

		
	
func get_camera_positions() -> Array:
	if !is_instance_valid(Camera_Position_Root):
		push_error("Camera Positions Root Not Valid")
		return []
		
	return Camera_Position_Root.get_children()
	

func get_player_camera() -> Camera3D:
	return _camera
