extends Node2D
class_name RadarDetector


enum RadarMode {
	NO_LOCK,
	LOCKED
}

const ROTATION_SPEED: float = 1
const FADE_OUT_INTERVAL: int = 1

@export var fadeout_packed: PackedScene

var current_radar_mode: RadarMode = RadarMode.NO_LOCK
var radar_lock_angle: float = 0
var _rotate_left: bool = true
var _in_range: bool = true

func _ready() -> void:
	HiddenButtonManager.set_radar_lock.connect(lock)
	HiddenButtonManager.turn_radar_lock.connect(turn_radar)
	RadarManager.detection_object = self


func _physics_process(delta: float) -> void:

	handle_rotation(delta)
	_create_fade_out()
	
	

	
func lock() -> void:
	if current_radar_mode == RadarMode.LOCKED:
		current_radar_mode = RadarMode.NO_LOCK
	else:
		current_radar_mode = RadarMode.LOCKED
		radar_lock_angle = rotation_degrees
	
func turn_radar(turn_amount: float) -> void:
	radar_lock_angle += turn_amount
	if radar_lock_angle > 180:
		radar_lock_angle -= 360
		
	if radar_lock_angle < -180:
		radar_lock_angle += 360
		

	
func handle_rotation(delta: float) -> void:

	if rotation_degrees > 360:
		rotation_degrees -= 360
		
	if rotation_degrees < -180:
		rotation_degrees += 360
	
	if current_radar_mode == RadarMode.NO_LOCK:
		rotate(ROTATION_SPEED * delta)
	else:
		
		var true_speed: float = ROTATION_SPEED * delta * 2

		

		
		var target_angle = radar_lock_angle
		var num_circles = 0
		num_circles = int(rotation_degrees - int(rotation_degrees) % 360) / 360

		var ture_rot = rotation_degrees
		target_angle = target_angle + 360 * num_circles
				
				
		var within_range = true
		if target_angle - 20 > rotation_degrees:
			within_range = false
			
		if target_angle + 20 < rotation_degrees:
			within_range = false
			
		
			
		if !within_range:
			_in_range = false
			if rotation_degrees < target_angle:
				_rotate_left = false
			else:
				_rotate_left = true
		else:
			_in_range = true
	
		if abs(rotation_degrees - radar_lock_angle) > 40:
			rotation_degrees = radar_lock_angle
			

			
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
		RadarManager.add_tracked_object.emit(area)
		area.create_radar_image()
		RadarManager.scanned_object.emit()
