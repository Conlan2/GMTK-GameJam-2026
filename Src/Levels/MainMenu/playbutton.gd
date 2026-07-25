extends Button

@onready var main_menu: Control = $".."

func _on_button_down() -> void:
	CameraMananger.moving_camera.emit("Center", 0.001)
	main_menu.visible = false
