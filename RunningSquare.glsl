vec2 rotate(vec2 v, float rot) {
    return v * mat2(cos(rot), -sin(rot), sin(rot), cos(rot));
}

bool computeSquare(vec2 uv, vec2 offset, float size, float rotation) {
    vec2 pos = rotate(vec2(uv.x - offset.x, uv.y - offset.y), rotation);
    return max(abs(pos.x), abs(pos.y)) < size / 2.0;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

    vec2 uv = fragCoord/iResolution.xy;
    uv -= 0.5;
    uv.x *= iResolution.x / iResolution.y;

    float size = 0.25;

    vec3 col = vec3(0.0,0.0,0.0);
    vec2 offset = vec2(0,0);
    
    if (computeSquare(uv, offset, 0.5, cos(iTime) * 2.0 + iTime)) {
        col = vec3(cos(iTime + uv.x) + 0.75);
    }
    
    if (computeSquare(uv, offset, sin(iTime)*0.125 + 0.25, cos(iTime) * 2.0 + iTime)) {
        col = vec3(0);
    }

    fragColor = vec4(col,1.0);
}