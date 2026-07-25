extends Node



var detection_object: RadarDetector
var tracked_objects: Array = []
var impact_time_left: float = 0
var active_incoming: bool = false

signal add_tracked_object(object: RadarObject)
signal delete_tracked_object(object: RadarObject)

signal scanned_object
signal finished_update

func _ready() -> void:
	delete_tracked_object.connect(_delete_tracked_object)
	add_tracked_object.connect(_add_tracked_object)
	
func _add_tracked_object(object: RadarObject) -> void:
	if object not in tracked_objects:
		tracked_objects.append(object)

	_calculate_impact_timer()
	finished_update.emit()

func _delete_tracked_object(index: int) -> void:

	if index != -1:
		tracked_objects.remove_at(index)
		
	_calculate_impact_timer()
	finished_update.emit()

	
func _process(delta: float) -> void:
	if active_incoming:
		impact_time_left -= delta
		
func _get_alarmed_tracked() -> Array:
	var alarm_tracked: Array = []
	for object in tracked_objects:
	
		if object is not RadarObject:
			continue
		var danger: RadarObject = object
		
		if danger.plane_type == RadarObjectTypes.type.CIVILIAN or\
				danger.plane_type == RadarObjectTypes.type.ENEMY_AIR or\
				danger.plane_type == RadarObjectTypes.type.INTERCEPTOR:
			# Ignore Plane Types
			continue
			
		alarm_tracked.append(danger)
		
	return alarm_tracked
		
func _calculate_impact_timer() -> void:
	
		
	var alarm_tracked = _get_alarmed_tracked()
	
	if len(alarm_tracked) == 0:
		impact_time_left = 0
		active_incoming = false
		return
	
	var min_timer = 999
	for tracked: RadarObject in alarm_tracked:
		var current_time = tracked.position.distance_to(Vector2(0,0))/tracked.movement_speed
		if current_time < min_timer:
			min_timer = current_time
			
	active_incoming = true
	impact_time_left = min_timer
		
		
		
		
