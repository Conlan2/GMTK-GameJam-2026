extends Node

signal intro_finished


var _initial_conversation: Conversation = Conversation.new()

func _ready() -> void:
	_initial_message()
	
func _initial_message() -> void:
	_initial_conversation.conversation = [
		{"who": "Phone", "text": "example_text"},
		{"who": "Phone", "text": "next_text"},
		{"who": "Ear", "text": "Response Text"},
	]
	
	PhoneManager.add_conversation_to_queue.emit(_initial_conversation)
	
	

	
	
