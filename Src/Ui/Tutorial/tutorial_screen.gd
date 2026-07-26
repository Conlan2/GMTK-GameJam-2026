extends Control


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("bring_tutorial"):
		visible = !visible

func _on_invisiquit_button_down() -> void:
	visible = false
