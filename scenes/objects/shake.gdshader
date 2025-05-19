shader_type canvas_item;

uniform float shake_intensity = 0.0;
uniform float shake_speed = 20.0;

void vertex() {
	// Called for every vertex the material is visible on.
	vec2 shake = vec2(0.0);
	
	// sprite sits at 0 on y access and y goes neg as it goes up
	if(VERTEX.y < 0.0) {
		//
		shake.x = sin(TIME * shake_speed + VERTEX.y) * shake_intensity;
	}
	
	VERTEX.xy += shake;
}

