extends Button



var held_down: bool = false

func _process(delta: float) -> void:
	if held_down:
		HiddenButtonManager.turn_radar_lock.emit(-1) 


func _on_button_down() -> void:
	if CameraMananger.camera_moving == false and CameraMananger.current_position.position_name == "Radar":
		held_down = true
		
func _on_button_up() -> void:
	held_down = false 
