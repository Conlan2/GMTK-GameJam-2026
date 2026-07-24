extends Panel
class_name ConversationLine

@onready var label: Label = $Label
var text: String = ""


func _ready() -> void:
	label.text = text
