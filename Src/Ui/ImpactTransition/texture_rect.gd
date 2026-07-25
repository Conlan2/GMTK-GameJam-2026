extends TextureRect


@onready var fade_out: TextureRect = $"../FadeOut"

var increasing: = 1
signal modulate_done

func _process(delta: float) -> void:
	modulate.a += (4) * delta * increasing

	if modulate.a >= 1:
		fade_out.visible = true
		increasing = -1
		modulate_done.emit()
