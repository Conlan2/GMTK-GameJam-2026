extends Node2D




@onready var label: Label = $CanvasLayer/Label
@export var text: String 

func _process(_delta: float) -> void:
	label.text = text
