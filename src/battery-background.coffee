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
    $(document).idleTimer(4000) if BBCONFIG.enableScreensaver

    overlay = $('<div class="ui-overlay"><div class="ui-widget-overlay"></div></div>').hide().appendTo('body')
    $(document).on "idle.idleTimer", () ->
      overlay.fadeIn() unless battery.charging

      $(window).resize () ->
        overlay.width($(document).width())
        overlay.height($(document).height())

    $(document).on "active.idleTimer", () ->
      overlay.fadeOut();


@batteryBackground ||= {}

for property, value of batteryBackground
  @batteryBackground[property] = value
