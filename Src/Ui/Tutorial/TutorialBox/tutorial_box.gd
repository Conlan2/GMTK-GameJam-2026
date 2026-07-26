extends PanelContainer


func _process(delta: float) -> void:
	if Input.is_action_pressed("bring_tutorial"):
		queue_free()
