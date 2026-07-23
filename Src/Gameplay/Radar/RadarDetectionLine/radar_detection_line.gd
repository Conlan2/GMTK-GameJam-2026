extends Node2D



enum RadarMode {
	NO_LOCK,
	LOCKED
}

const ROTATION_SPEED: float = 1
const FADE_OUT_INTERVAL: int = 1

@export var fadeout_packed: PackedScene

var current_radar_mode: RadarMode = RadarMode.LOCKED
var radar_lock_angle: float = 270
var _rotate_left: bool = true

func _physics_process(delta: float) -> void:

	handle_rotation(delta)
	_create_fade_out()
	

	
func handle_rotation(delta: float) -> void:

	
	
	if current_radar_mode == RadarMode.NO_LOCK:
		rotate(ROTATION_SPEED * delta)
	else:
		
		var true_speed: float = ROTATION_SPEED * delta * 2

		

		
		var target_angle = radar_lock_angle
		var num_circles = int(rotation_degrees - int(rotation_degrees) % 360) / 360
		target_angle = target_angle + 360 * num_circles
		if target_angle - 20 > rotation_degrees:
			_rotate_left = false
			true_speed = true_speed * 2
			
		if target_angle + 20 < rotation_degrees:
			_rotate_left = true
			true_speed = true_speed * 2

			
		if _rotate_left:
			rotate(-true_speed)
		else:
			rotate(true_speed)
			
		
				
	
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


func _on_detection_area_area_entered(area: Area2D) -> void:
	if area is RadarObject:
		area.create_radar_image()
