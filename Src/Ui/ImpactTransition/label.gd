extends Label

@onready var fade_out: TextureRect = $"../FadeOut"



func _process(delta: float) -> void:
	if fade_out.visible:
		modulate.a += delta * 0.2
