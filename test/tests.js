// Generated by CoffeeScript 1.4.0
(function() {

  test("batteryBackground should be initialized", function() {
    return ok(batteryBackground, "");
  });

  test("should initialize battery-background", function() {
    return ok(batteryBackground.init());
  });

  test("battery api should be availible (in firefox >=19.0)", function() {
    ok(batteryBackground.init());
    return batteryBackground.battery_api_availible;
  });

  test("should initialize default settings", function() {
    batteryBackground.init();
    return ok(batteryBackground.backgroundSelector() === "body");
  });

  test("should override selecor in config battery-background", function() {
    batteryBackground.init({
      backgroundSelector: "test"
    });
    return ok(batteryBackground.backgroundSelector() === "test");
  });

  test("should have two batterySavingStrategies", function() {
    batteryBackground.init();
    return ok(batteryBackground.batterySavingStrategy.count() === 2);
  });

  test("should call charging or discharging methods", function() {
    var BatterSavingMock, charging_called, discharging_called;
    batteryBackground.init();
    charging_called = 0;
    discharging_called = 0;
    BatterSavingMock = (function() {

      function BatterSavingMock() {}

      BatterSavingMock.prototype.discharging = function(battery) {
        return discharging_called += 1;
      };

      BatterSavingMock.prototype.charging = function(battery) {
        return charging_called += 1;
      };

      return BatterSavingMock;

    })();
    batteryBackground.batterySavingStrategy.removeAll();
    batteryBackground.batterySavingStrategy.add(new BatterSavingMock());
    ok(batteryBackground.batterySavingStrategy.count() === 1);
    ok(discharging_called === 0);
    ok(charging_called === 0);
    batteryBackground.batterySavingStrategy.charging();
    ok(discharging_called === 0);
    ok(charging_called === 1);
    batteryBackground.batterySavingStrategy.discharging();
    ok(discharging_called === 1);
    ok(charging_called === 1);
    batteryBackground.batterySavingStrategy.add(new BatterSavingMock());
    batteryBackground.batterySavingStrategy.charging();
    ok(discharging_called === 1);
    ok(charging_called === 3);
    batteryBackground.batterySavingStrategy.discharging();
    ok(discharging_called === 3);
    return ok(charging_called === 3);
  });

}).call(this);
