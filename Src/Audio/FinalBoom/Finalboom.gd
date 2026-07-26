extends AudioStreamPlayer3D


@onready var timer: Timer = $Timer



func _ready() -> void:
	EndingManager.play_ending.connect(_ending_process)

	
func _ending_process(_junk) -> void:
	play()
	timer.start()


func _on_timer_timeout() -> void:
	stop()


func _on_finished() -> void:
	stop()
