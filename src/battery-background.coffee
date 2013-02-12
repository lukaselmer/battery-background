batteryBackground =
  {}

batteryBackground.defaults =
  selector: "body"

batteryBackground.selector = () ->
  @config['selector']

#batteryBackground.config = () ->
#  @config

batteryBackground.init = (config) ->
  @battery = navigator.battery || navigator.mozBattery || navigator.webkitBattery
  return false unless this.battery_api_availible()

  @config = this.defaults

  if config
    for property, value of config
      @config[property] = value

  #document.querySelector('#charging')
  this

batteryBackground.battery_api_availible = () ->
  !!@battery

@batteryBackground = batteryBackground
