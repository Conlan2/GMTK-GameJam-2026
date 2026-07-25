extends Button

@export var main_menu: Node


func _on_button_down() -> void:
	CameraMananger.moving_camera.emit("Center", 0.001)
	main_menu.visible = false
