extends Button


func _on_button_down() -> void:
	HiddenButtonManager.intercept_button_pushed.emit()
