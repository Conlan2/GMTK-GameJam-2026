extends Node3D

@export var button_object: PhysicalButton

func _ready() -> void:
	HiddenButtonManager.intercept_button_pushed.connect(_on_push)
	
func _on_push() -> void:
	button_object.push_button()
