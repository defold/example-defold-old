components {
  id: "script"
  component: "/magic_example/butterfly.script"
}
embedded_components {
  id: "alt_sprite"
  type: "sprite"
  data: "default_animation: \"butterfly_blue\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/magic_example/magic_sprites.atlas\"\n"
  "}\n"
  ""
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"butterfly_orange\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/magic_example/magic_sprites.atlas\"\n"
  "}\n"
  ""
}
