extends Node

signal intro_finished


var _initial_conversation: Conversation = Conversation.new()

var conversations: Array = []

func _ready() -> void:
	_initial_message()
	load_conversations()
	
func load_conversations() -> void:
	load_conversation(200,
	[
		{"who": "Phone", "text": "This is flight IL121."},
		{"who": "Phone", "text": "We are an emergency medical transport, and our flight is not logged"},
		{"who": "Phone", "text": "We are not a hostile flight"}
	],
	)
	load_conversation(530,
	[
		{"who": "Phone", "text": "EMERGENCY ALERT FROM CIC."},
		{"who": "Phone", "text": "A Geomagnetic storm has caused false signatures to detected."},
		{"who": "Phone", "text": "These are NOT a nuclear attack."}
	],
	)
	load_conversation(685,
	[
		{"who": "Phone", "text": "Warning from CIC."},
		{"who": "Phone", "text": "Flight IL196 is a hostile aircraft, and was falsly added to the record by spies."},
		{"who": "Phone", "text": "Shootdown authorised."}
	],
	)
	
func load_conversation(conversation_time: float, conversation_data: Array) -> void:
	var new_conversation = Conversation.new()
	new_conversation.conversation = conversation_data
	conversations.append({"time": conversation_time, "conversation": new_conversation})
	
func _process(delta: float) -> void:
	if len(conversations) <= 0:
		return
	
	for conversation_log in conversations:
		if conversation_log["time"] <= TimeManager.game_timer:
			PhoneManager.add_conversation_to_queue.emit(
				conversations.pop_front()["conversation"]
			)
	
	
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
		{"who": "Phone", "text": "The enemy may attempt to disguise an attack as a civilan craft."},
		{"who": "Phone", "text": "We have provided a sheet with all authorised flights in your area."},
		{"who": "Phone", "text": "You are authorized to shoot down any aircraft that is not registered."},
		{"who": "Phone", "text": "Confirm message recived."},
		{"who": "Ear", "text": "Confirm message recived."},
		{"who": "Phone", "text": "CIC Out."},
	]
	
	PhoneManager.add_conversation_to_queue.emit(_initial_conversation)
	
	

	
	
