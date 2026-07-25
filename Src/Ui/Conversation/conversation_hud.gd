extends Control

@onready var container: VFlowContainer = $Container
@export var right_packed: PackedScene
@export var left_packed: PackedScene

var conversation: Conversation = null
var active_conversation: bool = false


func _ready() -> void:
	PhoneManager.conversation_listened.connect(_new_conversation)
	
	
func _new_conversation(new_conversation: Conversation) -> void:
	visible = true
	
	conversation = new_conversation
	active_conversation = true
	_new_line()
	
func _input(event: InputEvent) -> void:
	if !is_instance_valid(conversation) or !active_conversation:
		return
		
		
	if event is InputEventMouseButton and event.pressed == true:
		_new_line()
	
func _update_children() -> void:
	for child in container.get_children():
		if child is ConversationLine:
			child.modulate.a -= 0.15
			
			if child.modulate.a <= 0:
				child.queue_free()
	
func _new_line() -> void:
	if len(conversation.conversation) == 0 and active_conversation == true:
		active_conversation = false
		visible = false
		conversation = null
		PhoneManager.conversation_finished.emit()
		ConversationManager.intro_finished.emit()
		
		for child in container.get_children():
			child.queue_free()
		
		
		return
	
	_update_children()
	
	var line: Dictionary = conversation.conversation.pop_front()
	
	
	var conversation_line: ConversationLine = null
	if line["who"] == "Phone":
		conversation_line = right_packed.instantiate() as ConversationLine
	else:
		conversation_line = left_packed.instantiate() as ConversationLine
	conversation_line.text = line["text"]
	container.add_child(conversation_line)
	

	
	
