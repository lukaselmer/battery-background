@batteryBackground = {}
@batteryBackground.init = (settings) ->
  @battery = navigator.battery || navigator.mozBattery || navigator.webkitBattery
  #console.log settings
  #document.querySelector('#charging')
@batteryBackground.defaults =
  background_selector: "body"
@batteryBackground.battery_api_availible? () ->
  !!@battery


