extends Node3D

@onready var disarm_key: PhysicalButton = $DisarmKey


func _ready() -> void:
	HiddenButtonManager.disarm_interceptors.connect(disarm_key.push_button)
	
