extends AudioStreamPlayer3D





func _ready() -> void:
	EndingManager.play_ending.connect(_ending_process)

	
func _ending_process(_junk) -> void:
	queue_free()
	
	
func _process(delta: float) -> void:
	if !NuclearWarManager.war_timer.is_stopped() and !playing:
		play()
	
	if NuclearWarManager.war_timer.is_stopped() and playing:
		stop()


func _on_finished() -> void:
	play()
