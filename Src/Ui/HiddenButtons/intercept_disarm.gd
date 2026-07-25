extends Button



func _ready() -> void:
	HiddenButtonManager.move_plane_log.connect(swap_vis)
	HiddenButtonManager.remove_plane_log.connect(swap_vis)
	
	
func swap_vis() -> void:
	visible = !visible


func _on_button_down() -> void:
	if CameraMananger.current_position.name != "CenterPosition":
		return
	
	HiddenButtonManager.remove_plane_log.emit()

	
	
