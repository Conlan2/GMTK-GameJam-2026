extends Control




func _process(delta: float) -> void:
	if !is_instance_valid(CameraMananger.current_position ):
		return
	
	visible = CameraMananger.current_position.name == "CenterPosition"
