// Generated by CoffeeScript 1.4.0
(function() {
  var BatterySavingFacade, batterSavingByBackgroundAdjustment, batterSavingByTimeout, batteryBackground, batterySavingFacade, property, value;

  batteryBackground = {
    defaults: {
      backgroundSelector: "body"
    },
    backgroundSelector: function() {
      return this.config['backgroundSelector'];
    },
    init: function(config) {
      this.battery = navigator.battery || navigator.mozBattery || navigator.webkitBattery;
      if (!this.battery_api_availible()) {
        return false;
      }
      this.initConfig(config);
      return this;
    },
    initConfig: function(config) {
      var property, value, _results;
      this.config = this.defaults;
      if (config) {
        _results = [];
        for (property in config) {
          value = config[property];
          _results.push(this.config[property] = value);
        }
        return _results;
      }
    },
    battery_api_availible: function() {
      return !!this.battery;
    }
  };

  this.batteryBackground || (this.batteryBackground = {});

  for (property in batteryBackground) {
    value = batteryBackground[property];
    this.batteryBackground[property] = value;
  }

  batterSavingByTimeout = {
    discharging: function(battery) {
      return console.log("batterSavingByTimeout" + percentage);
    },
    charging: function() {}
  };

  batterSavingByBackgroundAdjustment = {
    discharging: function(battery) {
      return console.log("batterSavingByBackgroundAdjustment" + percentage);
    },
    charging: function() {}
  };

  BatterySavingFacade = (function() {

    function BatterySavingFacade() {}

    BatterySavingFacade.prototype.strategies = function() {
      this.batterySavingStrategies || (this.batterySavingStrategies = []);
      return this.batterySavingStrategies;
    };

    BatterySavingFacade.prototype.add = function(batterySavingStrategy) {
      return this.strategies().push(batterySavingStrategy);
    };

    BatterySavingFacade.prototype.removeAll = function() {
      return this.batterySavingStrategies = [];
    };

    BatterySavingFacade.prototype.discharging = function(battery) {
      var strategy, _i, _len, _ref, _results;
      _ref = this.strategies();
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        strategy = _ref[_i];
        _results.push(strategy.charging());
      }
      return _results;
    };

    BatterySavingFacade.prototype.charging = function(battery) {
      var strategy, _i, _len, _ref, _results;
      _ref = this.strategies();
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        strategy = _ref[_i];
        _results.push(strategy.charging());
      }
      return _results;
    };

    BatterySavingFacade.prototype.count = function() {
      return this.strategies().length;
    };

    return BatterySavingFacade;

  })();

  batterySavingFacade = new BatterySavingFacade();

  batterySavingFacade.add(batterSavingByTimeout);

  batterySavingFacade.add(batterSavingByBackgroundAdjustment);

  console.log(batterySavingFacade.count());

  this.batteryBackground || (this.batteryBackground = {});

  this.batteryBackground.batterySavingStrategy = batterySavingFacade;

}).call(this);
