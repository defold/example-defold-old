components {
  id: "script"
  component: "/input_example/multitouch.script"
}
embedded_components {
  id: "id"
  type: "label"
  data: "size {\n"
  "}\n"
  "text: \"Touch ##\"\n"
  "font: \"/main/font/headline.font\"\n"
  "material: \"/builtins/fonts/label.material\"\n"
  ""
  position {
    y: 70.1487
  }
  scale {
    x: 0.5
    y: 0.5
  }
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"multi_touch_indicator\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/input_example/input_sprites.atlas\"\n"
  "}\n"
  ""
}
