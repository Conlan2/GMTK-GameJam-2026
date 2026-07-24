extends Control
class_name ConversationLine

@export var label: Label = null
var text: String = ""




func _ready() -> void:
	label.text = text
