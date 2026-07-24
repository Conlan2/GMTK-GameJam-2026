extends Node


var game_timer = 0
var is_started: bool = true


func _ready() -> void:
	ConversationManager.intro_finished.connect(_start_time)
	
	
func _start_time() -> void:
	is_started = true
	
func _process(delta: float) -> void:
	if is_started:
		game_timer += delta
	
	
	
	
	
	
