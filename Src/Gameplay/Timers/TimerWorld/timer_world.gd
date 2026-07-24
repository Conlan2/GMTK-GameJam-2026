extends Node2D




@onready var label: Label = $CanvasLayer/Label
@export var text: String 

func _process(delta: float) -> void:
	label.text = text
