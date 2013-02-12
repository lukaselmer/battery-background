if @batteryBackground
  console.log "Naming collision detected: batteryBackground already definded."

@batteryBackground = {}
@batteryBackground.init = (settings) ->
  console.log settings

