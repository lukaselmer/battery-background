batterySaver =
  saveBattery = (percentage) ->
    # TODO: save battery
  reset = () ->
    # TODO: reset battery saving

@batteryBackground ||= {}
@batteryBackground.batterySaver ||= batterySaver
