batteryBackground =
  defaults:
    backgroundSelector: "body"

  backgroundSelector: () ->
    @config['backgroundSelector']

  init: (config) ->
    @battery = navigator.battery || navigator.mozBattery || navigator.webkitBattery
    return false unless this.battery_api_availible()
    this.initConfig(config)
    this

  initConfig: (config) ->
    @config = this.defaults
    if config
      for property, value of config
        @config[property] = value

  battery_api_availible: () ->
    !!@battery

@batteryBackground ||= {}

for property, value of batteryBackground
  @batteryBackground[property] = value
