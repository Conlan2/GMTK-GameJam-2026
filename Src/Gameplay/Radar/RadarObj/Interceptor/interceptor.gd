extends RadarObject
class_name Interceptor

var is_locked_on: bool = false

var target: RadarObject = null



func _on_lock_on_area_entered(area: Area2D) -> void:
	#if is_locked_on:
		#return
	
	if area is RadarObject and area is not Interceptor:

		is_locked_on = true
		target = area
		movement_speed = movement_speed * 2
		
func check_special_properties() -> void:
	if is_locked_on:
		movement_angle_deg = rad_to_deg((position - target.position).angle() - 90) 
		_update_move_vector()
		
func _special_ready() -> void:
	HiddenButtonManager.disarm_interceptors.connect(_disarmed)
	
func _disarmed() -> void:
	queue_free()
		
