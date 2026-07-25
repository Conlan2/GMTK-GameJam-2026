extends Control




func _process(delta: float) -> void:
	visible = CameraMananger.current_position.name == "CenterPosition"
