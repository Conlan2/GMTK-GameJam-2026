extends Node2D



const ROTATION_SPEED: float = 1
const FADE_OUT_INTERVAL: int = 1

@export var fadeout_packed: PackedScene

func _physics_process(delta: float) -> void:
	rotate(ROTATION_SPEED * delta)
	_create_fade_out()
	
func _create_fade_out() -> void:
	if Engine.get_process_frames() % FADE_OUT_INTERVAL != 0:
		return
		
	if !is_instance_valid(fadeout_packed) or !fadeout_packed.can_instantiate():
		push_error("Could Not Create Fadeout line for Radar")
		return
		
	var fadeout_line: Node2D = fadeout_packed.instantiate()
	if !is_instance_valid(fadeout_line):
		push_error("Fadeout Line failed to instansitate properly")
		return
		
	fadeout_line.rotation = rotation	
		
	get_parent().add_child(fadeout_line)
