components {
  id: "script"
  component: "/modules_example/yellow_butterfly.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"yellow_butterfly\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/modules_example/modules_sprites.atlas\"\n"
  "}\n"
  ""
}
