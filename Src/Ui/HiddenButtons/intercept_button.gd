extends Button


func _on_button_down() -> void:
	if CameraMananger.camera_moving == false and CameraMananger.current_position.position_name == "Center":
		HiddenButtonManager.intercept_button_pushed.emit()
