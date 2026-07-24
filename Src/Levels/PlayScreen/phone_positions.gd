extends Node


func _ready() -> void:
	var phone_dict: Dictionary = {}
	for child in get_children():
		phone_dict[child.name.to_lower()] = child
		
	PhoneManager.phone_locations = phone_dict
	PhoneManager.phone_current_location = phone_dict["home"] as Marker3D
	
