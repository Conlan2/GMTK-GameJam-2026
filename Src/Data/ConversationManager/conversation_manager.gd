extends Node

signal intro_finished


var _initial_conversation: Conversation = Conversation.new()

func _ready() -> void:
	_initial_message()
	
func _initial_message() -> void:
	_initial_conversation.conversation = [
		{"who": "Phone", "text": "This is North Control CIC. Confirm Connection."},
		{"who": "Ear", "text": "Confirmed."},
		{"who": "Phone", "text": "DEFCON level has been raised to 2."},
		{"who": "Phone", "text": "A nuclear attack is possible with the next 24 hours."},
		{"who": "Phone", "text": "Their new hypersonic strike vehicles can deliver a nuclear strike within 30 seconds of detection."},
		{"who": "Phone", "text": "Your defense battery has been equiped with interception capable missles."},
		{"who": "Phone", "text": "The enemy is aware of this, and may strike your system with conventional aircraft."},
		{"who": "Phone", "text": "Unfortunatly, our government did not want to cause a panic, and our airspace is open to civilian traffic."},
		{"who": "Phone", "text": "The enemy may attempt to disguise a plane as a civilan craft."},
		{"who": "Phone", "text": "We have provided a sheet with all authorised flights in your area."},
		{"who": "Phone", "text": "You are authorized to shoot down any plane that is not registered."},
		{"who": "Phone", "text": "Confirm message recived."},
		{"who": "Ear", "text": "Confirm message recived."},
		{"who": "Phone", "text": "CIC Out."},


	]
	
	PhoneManager.add_conversation_to_queue.emit(_initial_conversation)
	
	

	
	
