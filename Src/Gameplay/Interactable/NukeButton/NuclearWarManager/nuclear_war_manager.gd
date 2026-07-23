extends Node

@export var war_timer: Timer



func _ready() -> void:
	HiddenButtonManager.nuke_button_pushed.connect(_start_launch)
	
func _start_launch() -> void:
	war_timer.start()
