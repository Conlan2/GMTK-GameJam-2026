extends Label

@onready var fade_out: TextureRect = $"../FadeOut"
var active = false


func _process(delta: float) -> void:
	if fade_out.visible and active:
		modulate.a += delta * 0.2
