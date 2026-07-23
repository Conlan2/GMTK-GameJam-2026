extends Button


func _on_button_down() -> void:
	HiddenButtonManager.nuke_button_pushed.emit()
