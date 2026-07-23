extends Node3D


@onready var lock_button: PhysicalButton = $LockButton


func _ready() -> void:
	HiddenButtonManager.set_radar_lock.connect(lock_button.push_button)
	
