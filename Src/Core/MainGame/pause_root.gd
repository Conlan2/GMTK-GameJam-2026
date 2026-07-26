extends Control


func _process(delta: float) -> void:
	visible = get_tree().paused
		
