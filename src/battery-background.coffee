batteryBackground =
  {}

batteryBackground.defaults =
  backgroundSelector: "body"
  querySelector: document.querySelector

batteryBackground.backgroundSelector = () ->
  @config['backgroundSelector']

batteryBackground.init = (config) ->
  @battery = navigator.battery || navigator.mozBattery || navigator.webkitBattery
  return false unless this.battery_api_availible()

  @config = this.defaults


  #console.log document.querySelector("body")

  console.log @config.querySelector
  if config
    for property, value of config
      @config[property] = value

  #@config['querySelector'](this.backgroundSelector())
  this

batteryBackground.battery_api_availible = () ->
  !!@battery

@batteryBackground = batteryBackground
