extends RadarSpawner



@export var packed_interceptor: PackedScene

func _override_ready() -> void:
	HiddenButtonManager.intercept_button_pushed.connect(_interception_launch)

func _interception_launch() -> void:
	if RadarManager.detection_object.current_radar_mode == RadarDetector.RadarMode.NO_LOCK:
		return
	
	
	if !is_instance_valid(packed_interceptor) or !packed_interceptor.can_instantiate():
		push_error("Packed Interceptor was not valid")
		return
		
	var interceptor_object: Interceptor = packed_interceptor.instantiate() as Interceptor
	if !is_instance_valid(interceptor_object):
		push_error("Created Interceptor was not valid")
		return
	
	interceptor_object.movement_angle_deg = RadarManager.detection_object.radar_lock_angle
	add_child(interceptor_object)
	
	

		
