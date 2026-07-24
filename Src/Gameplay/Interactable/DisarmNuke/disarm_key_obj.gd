extends Node3D

@onready var disarm_key: PhysicalButton = $NukeKey


func _ready() -> void:
	HiddenButtonManager.disarm_nuke.connect(disarm_key.push_button)
	
