test "batteryBackground should be initialized", () ->
  ok(batteryBackground, "")

test "should initialize battery-background", () ->
  ok(batteryBackground.init())

test "battery api should be availible (in firefox >=19.0)", () ->
  ok(batteryBackground.init(selector: "body"))
  batteryBackground.battery_api_availible

test "should initialize default settings", () ->
  batteryBackground.init()
  ok(batteryBackground.selector() == "body")

test "should override selecor in config battery-background", () ->
  batteryBackground.init(selector: "test")
  ok(batteryBackground.selector() == "test")

