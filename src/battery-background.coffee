batteryBackground =
  defaults:
    backgroundSelector: "body"

  backgroundSelector: () ->
    @config['backgroundSelector']

  init: (config) ->
    @battery = navigator.battery || navigator.mozBattery || navigator.webkitBattery
    return false unless this.battery_api_availible()
    this.initConfig(config)
    this.registerBatteryListeners()
    this

  initConfig: (config) ->
    @config = this.defaults
    if config
      for property, value of config
        @config[property] = value

  battery_api_availible: () ->
    !!@battery

  registerBatteryListeners: () ->
    battery = @battery
    strategy = this.batterySavingStrategy

    checkBatteryStatus = () ->
      if battery.charging
        strategy.charging(battery)
      else
        strategy.discharging(battery)

    setInterval(checkBatteryStatus, 60000)
    battery.addEventListener("chargingchange", checkBatteryStatus, false);
    battery.addEventListener("levelchange", checkBatteryStatus, false);
    checkBatteryStatus()

    #$(document).idleTimer()
    #$( document ).idleTimer( 1000 )
    #$( document ).on "idle.idleTimer", () ->
    #$( document ).on "active.idleTimer", () ->



@batteryBackground ||= {}

for property, value of batteryBackground
  @batteryBackground[property] = value

