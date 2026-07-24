extends Node3D
class_name PhysicalButton

@export var button_replacement_material: Material
@export var button_mesh: MeshInstance3D
@export var mesh_replace_num: int = 1

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var animation_name: String = "PushButton"


func _ready() -> void:
	if is_instance_valid(button_replacement_material):
		button_mesh.set_surface_override_material(1, button_replacement_material)

func push_button() -> void:
	animation_player.play(animation_name)
	
