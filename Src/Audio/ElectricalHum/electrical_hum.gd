extends AudioStreamPlayer3D

@export var delay: float 
var time = 0


func _ready() -> void:
	EndingManager.play_ending.connect(_ending_process)
	
func _ending_process(_junk) -> void:
	queue_free()

func _process(delta: float) -> void:
	time += delta
	
	if time > delay and !playing:
		play()

func _on_finished() -> void:
	play()


func _on_timer_timeout() -> void:
	play()
