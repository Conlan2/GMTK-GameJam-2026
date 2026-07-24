extends Control

@onready var container: VBoxContainer = $Container
@export var right_packed: PackedScene
@export var left_packed: PackedScene

var conversation: Conversation = null
var active_conversation: bool = false


func _ready() -> void:
	PhoneManager.conversation_listened.connect(_new_conversation)
	
	
func _new_conversation(new_conversation: Conversation) -> void:
	visible = true
	
	for child in container.get_children():
		queue_free()
		
	conversation = new_conversation
	active_conversation = true
	_new_line()
	
func _input(event: InputEvent) -> void:
	if !is_instance_valid(conversation) or !active_conversation:
		return
		
		
	if event is InputEventMouseButton and event.pressed == true:
		_new_line()
	
func _new_line() -> void:
	if len(conversation.conversation) == 0:
		active_conversation = false
		visible = false
		conversation = null
		PhoneManager.conversation_finished.emit()
		return
	
	var line: Dictionary = conversation.conversation.pop_front()
	
	var conversation_line: ConversationLine = null
	if line["who"] == "Phone":
		conversation_line = right_packed.instantiate() as ConversationLine
	else:
		conversation_line = left_packed.instantiate() as ConversationLine
	conversation_line.text = line["text"]
	container.add_child(conversation_line)
		
	
	
