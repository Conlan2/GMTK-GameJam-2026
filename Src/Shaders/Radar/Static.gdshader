shader_type canvas_item;

uniform sampler2D COLOUR_TEXTURE: hint_screen_texture, filter_linear;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float random_value = fract(sin(dot(TIME * FRAGCOORD.xy / 2., vec2(12.9898,78.233)))) * 43758.5453 / TIME;
	vec3 base_colour = texture(COLOUR_TEXTURE, UV).rgb;
	COLOR.rgb = clamp(base_colour * random_value * 0.02, vec3(base_colour*0.9), vec3(base_colour*1.1));
	
	
	
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
