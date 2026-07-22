extends Node


func _ready() -> void:
	for child in get_children():
		if child is CameraSpawner:
			CameraMananger.camera_positions[child.position_name] = child
		
