extends Button


func _on_button_down() -> void:
	if CameraMananger.camera_moving == false and CameraMananger.current_position.position_name == "Radar":
		HiddenButtonManager.set_radar_lock.emit() # Replace with function body.
