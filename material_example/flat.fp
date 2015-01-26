// The texture coordinate for this fragment is varying between the
// vertices.
varying mediump vec2 var_texcoord0;

// The texture data for the component is accessed through a sampler2D
uniform sampler2D diffuse_texture;

void main()
{
    // Lookup the color of the texture at this fragment's coordinate and
    // set the fragment color to it.
    gl_FragColor = texture2D(diffuse_texture, var_texcoord0);
}
