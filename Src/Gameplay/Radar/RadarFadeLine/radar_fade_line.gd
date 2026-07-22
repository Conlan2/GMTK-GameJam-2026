extends Node2D

const ALPHA_LOSS: int = 1

func _process(delta: float) -> void:
	modulate.a -= ALPHA_LOSS * delta
	
	if modulate.a <= 0:
		queue_free()
