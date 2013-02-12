test "batteryBackground should be initialized", () ->
  ok(batteryBackground, "")

test "should initialize battery-background", () ->
  ok(batteryBackground.init(selector: "body"))

test "battery api should be availible (in firefox >=19.0)", () ->
  ok(batteryBackground.init(selector: "body"))
  batteryBackground.battery_api_availible