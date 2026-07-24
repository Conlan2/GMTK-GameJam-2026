extends Button





func _on_button_down() -> void:
	if CameraMananger.current_position.name != "CenterPosition":
		return
	
	HiddenButtonManager.disarm_interceptors.emit()
