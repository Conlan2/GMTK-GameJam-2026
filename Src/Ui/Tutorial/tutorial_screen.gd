extends Control


func _process(delta: float) -> void:
	if Input.is_action_pressed("bring_tutorial"):
		visible = true

func _on_invisiquit_button_down() -> void:
	visible = false
