extends Button

@onready var remove_plane_log: Button = $"."

func _ready() -> void:
	HiddenButtonManager.move_plane_log.connect(_active)
	HiddenButtonManager.remove_plane_log.connect(swap_vis)
	
func _active() -> void:
	remove_plane_log.visible = true
	
func _process(delta: float) -> void:
	if CameraMananger.current_position.name != "CenterPosition":
		remove_plane_log.visible  = false

	
	
func swap_vis() -> void:
	remove_plane_log.visible  = false


func _on_button_down() -> void:
	if CameraMananger.current_position.name != "CenterPosition":
		remove_plane_log.visible  = false
		return
	
	HiddenButtonManager.remove_plane_log.emit()

	
	
