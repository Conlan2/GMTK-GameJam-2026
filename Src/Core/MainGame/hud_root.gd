extends Control



@onready var level_root: Node = $"../../World/LevelRoot"




func _process(delta: float) -> void:
	if level_root.get_children()[0].name == "PlayScreen":
		visible = true
		
	else:
		visible = false
