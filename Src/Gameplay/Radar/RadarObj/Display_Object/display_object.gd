extends Node2D
class_name RadarDisplayObject

const ALPHA_LOSS: float = 0.25

@export var detected_name: String
@export var detected_height: String
@export var detected_distance: String

@onready var object_name: Label = $ObjectName
@onready var object_distance: Label = $"Object Distance"
@onready var object_height: Label = $"Object Height"



func _ready() -> void:
	object_name.text = detected_name
	object_distance.text = detected_height
	object_height.text = detected_distance
	


func _process(delta: float) -> void:
	modulate.a -= ALPHA_LOSS * delta
	
	if modulate.a <= 0:
		queue_free()
