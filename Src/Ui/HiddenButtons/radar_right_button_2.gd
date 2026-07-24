extends Button


func _on_button_down() -> void:
	if PhoneManager.phone_moving or CameraMananger.current_position.name != "CenterPosition":
		return
	
	if PhoneManager.phone_current_location.name == "ear":
		HiddenButtonManager.phone_move.emit("home")
	else:
		HiddenButtonManager.phone_move.emit("ear")
