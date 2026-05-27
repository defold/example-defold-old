components {
  id: "script"
  component: "/magic_example/wand.script"
}
embedded_components {
  id: "magic_factory"
  type: "factory"
  data: "prototype: \"/magic_example/magic.go\"\n"
  ""
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"wand\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/magic_example/magic_sprites.atlas\"\n"
  "}\n"
  ""
}
