extends Node3D
class_name TimerIcon

@onready var icon: MeshInstance3D = $Icon
@export var surface_world: StandardMaterial3D = null
@export var timer_world: Node2D = null


func _ready() -> void:
	icon.set_surface_override_material(0, surface_world)
	
