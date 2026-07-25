extends Node

@export var war_timer: Timer



func _ready() -> void:
	HiddenButtonManager.nuke_button_pushed.connect(_start_launch)
	HiddenButtonManager.disarm_nuke.connect(_cancel_launch)
	
func _start_launch() -> void:
	if war_timer.is_stopped():
		war_timer.start()
	
func _cancel_launch() -> void:
	war_timer.stop()


func _on_war_timer_timeout() -> void:
	if TimeManager.game_timer < 500:
		EndingManager.play_ending.emit("Early_Nuke")
		
	elif TimeManager.game_timer < 600:
		EndingManager.play_ending.emit("Glitch_Nuke")
		
	else:
		EndingManager.play_ending.emit("Final_Attack_Nuke")
