test "batteryBackground should be initialized", () ->
  ok(batteryBackground, "")

test "should initialize battery-background", () ->
  ok(batteryBackground.init())

test "battery api should be availible (in firefox >=19.0)", () ->
  ok(batteryBackground.init())
  batteryBackground.battery_api_availible

test "should initialize default settings", () ->
  batteryBackground.init()
  ok(batteryBackground.backgroundSelector() == "body")

test "should override selecor in config battery-background", () ->
  batteryBackground.init(backgroundSelector: "test")
  ok(batteryBackground.backgroundSelector() == "test")


test "should have two batterySavingStrategies", () ->
  batteryBackground.init()
  ok(batteryBackground.batterySavingStrategy.count() == 2)

