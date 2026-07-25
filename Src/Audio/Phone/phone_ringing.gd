extends AudioStreamPlayer3D

var _is_playing: bool = false

func _ready() -> void:
	EndingManager.play_ending.connect(_ending_process)
	
func _ending_process(_junk) -> void:
	queue_free()

func _process(delta: float) -> void:
	if len(PhoneManager.conversation_queue) > 0:
		_is_playing = true
	else:
		_is_playing = false
		stop()	
	
		
	if _is_playing and !playing:
		play()
	
