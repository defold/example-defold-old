components {
  id: "tilemap"
  component: "/physics_example/level.tilemap"
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "collision_shape: \"/physics_example/level.tilemap\"\n"
  "type: COLLISION_OBJECT_TYPE_STATIC\n"
  "mass: 0.0\n"
  "friction: 0.5\n"
  "restitution: 0.5\n"
  "group: \"\"\n"
  "mask: \"player\"\n"
  "mask: \"balls\"\n"
  ""
}
