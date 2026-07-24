extends Area2D
class_name RadarObject


@export_group("Movement")
@export var movement_angle_deg: float = 0 
@export var movement_speed: float = 10
@export var height_change: float = 0

@export_group("Type")
@export var object_name: String
@export var start_height: float
@export var plane_type: RadarObjectTypes.type

@export_group("Display")
@export var packed_display_object: PackedScene

var current_height: float
var _movement_vector: Vector2


signal detected

func _ready() -> void:
	detected.connect(create_radar_image)
	_update_move_vector()
	current_height = start_height
	
	
func _update_move_vector() -> void:
	_movement_vector = Vector2(0, -movement_speed)\
		.rotated(deg_to_rad(movement_angle_deg))
	
func _physics_process(delta: float) -> void:
	position += _movement_vector * delta
	
func _process(delta: float) -> void:
	check_special_properties()
	current_height -= height_change * delta

func create_radar_image() -> void:
	if !is_instance_valid(packed_display_object) or !packed_display_object.can_instantiate():
		push_error("Packed Display Object is not valid for " + object_name)
		return
		
	var display_object: RadarDisplayObject =\
	 packed_display_object.instantiate() as RadarDisplayObject
	
	if !is_instance_valid(display_object) :
		push_error("Packed Display failed instantiation for " + object_name)
		return
		
	display_object.detected_name = object_name
	display_object.detected_height = str(round(current_height))
	display_object.detected_distance = str(\
		round(position.distance_to(Vector2(0,0))*100)/100)
	display_object.position = position
	
	get_parent().add_child(display_object)
	
func check_special_properties() -> void:
	pass
	
func _on_area_entered(area: Area2D) -> void:
	
	
	if area is RadarObject:
		
		# Reject Interceptor - Interceptor Collisions
		if area.plane_type == RadarObjectTypes.type.INTERCEPTOR and\
			plane_type == RadarObjectTypes.type.INTERCEPTOR:
			return
		
		if area.plane_type == RadarObjectTypes.type.INTERCEPTOR or\
			plane_type == RadarObjectTypes.type.INTERCEPTOR:
				
			area.queue_free()
			queue_free()
			
			
			
		 
	
