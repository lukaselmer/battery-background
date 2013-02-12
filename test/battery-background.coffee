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


test "should call charging or discharging methods", () ->
  batteryBackground.init()

  charging_called = 0
  discharging_called = 0

  class BatterSavingMock
    discharging: (battery) ->
      discharging_called += 1
    charging: () ->
      charging_called += 1

  batteryBackground.batterySavingStrategy.removeAll()
  batteryBackground.batterySavingStrategy.add(new BatterSavingMock())
  ok(batteryBackground.batterySavingStrategy.count() == 1)
  ok(discharging_called == 0)
  ok(charging_called == 0)
  batteryBackground.batterySavingStrategy.charging()
  ok(discharging_called == 0)
  ok(charging_called == 1)
  batteryBackground.batterySavingStrategy.discharging()
  ok(discharging_called == 1)
  ok(charging_called == 1)
  batteryBackground.batterySavingStrategy.add(new BatterSavingMock())
  batteryBackground.batterySavingStrategy.charging()
  ok(discharging_called == 1)
  ok(charging_called == 3)
  batteryBackground.batterySavingStrategy.discharging()
  ok(discharging_called == 3)
  ok(charging_called == 3)






