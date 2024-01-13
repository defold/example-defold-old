varying mediump vec2 var_texcoord0;

uniform sampler2D diffuse_texture;
uniform lowp vec4 blur;

void main()
{
//    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    
    lowp float blurAmount = blur.x;
    highp vec4 sum = vec4(0,0,0,1);

    sum += texture2D(diffuse_texture, vec2(var_texcoord0.x, var_texcoord0.y - 4.0 * blurAmount)) * 0.05;
    sum += texture2D(diffuse_texture, vec2(var_texcoord0.x, var_texcoord0.y - 3.0 * blurAmount)) * 0.09;
    sum += texture2D(diffuse_texture, vec2(var_texcoord0.x, var_texcoord0.y - 2.0 * blurAmount)) * 0.12;
    sum += texture2D(diffuse_texture, vec2(var_texcoord0.x, var_texcoord0.y - blurAmount)) * 0.15;
    sum += texture2D(diffuse_texture, vec2(var_texcoord0.x, var_texcoord0.y)) * 0.16;
    sum += texture2D(diffuse_texture, vec2(var_texcoord0.x, var_texcoord0.y + blurAmount)) * 0.15;
    sum += texture2D(diffuse_texture, vec2(var_texcoord0.x, var_texcoord0.y + 2.0 * blurAmount)) * 0.12;
    sum += texture2D(diffuse_texture, vec2(var_texcoord0.x, var_texcoord0.y + 3.0 * blurAmount)) * 0.09;
    sum += texture2D(diffuse_texture, vec2(var_texcoord0.x, var_texcoord0.y + 4.0 * blurAmount)) * 0.05;

    gl_FragColor = sum;
}