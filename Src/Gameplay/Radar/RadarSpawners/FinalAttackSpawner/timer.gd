extends Timer


func _ready() -> void:
	ConversationManager.intro_finished.connect(_start_time)
	
func _start_time() -> void:
	start()
