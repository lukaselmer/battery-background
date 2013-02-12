batteryBackground =
  {}

batteryBackground.defaults =
  background_selector: "body"

batteryBackground.init = (settings) ->
  @battery = navigator.battery || navigator.mozBattery || navigator.webkitBattery
  return false unless this.battery_api_availible()
  console.log settings
  document.querySelector('#charging')
  this

batteryBackground.battery_api_availible = () ->
  !!@battery

@batteryBackground = batteryBackground
