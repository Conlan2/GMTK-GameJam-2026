extends Button

@onready var launch_timer: Timer = $LaunchTimer

func _on_button_down() -> void:
	if !launch_timer.is_stopped():
		return

	if CameraMananger.camera_moving == false and CameraMananger.current_position.position_name == "Center":
		HiddenButtonManager.intercept_button_pushed.emit()
		launch_timer.start()
		
