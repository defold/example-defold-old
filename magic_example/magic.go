components {
  id: "script"
  component: "/magic_example/magic.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"magic\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/magic_example/magic_sprites.atlas\"\n"
  "}\n"
  ""
}
