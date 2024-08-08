// Just playing around

float dist(vec2 p0, vec2 p1) {
    return sqrt(pow(p0.x - p1.x, 2.0) + pow(p0.y - p1.y, 2.0));
}

float map(float value, float min1, float max1, float min2, float max2) {
  return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    vec2 center = vec2(0.5,0.5);
    vec3 color = vec3(1,0,0);
    
    color = vec3(cos(iTime + uv.x), sin(iTime + uv.x), 0);
    
    float d = dist(center, uv);
    if (d < 0.3 || d > 0.6)
    {
        fragColor = vec4(color,1);
    } else {
        if (d > 0.4) {
            fragColor = vec4(0,0,0,1);
        } else {
            fragColor = vec4(map(d, 0.3, 0.4, 0.5, 0.1),0,0,1) * sin(iTime);
        }
    }
}