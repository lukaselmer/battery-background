batterSavingByTimeout =
  discharging: (battery) ->
    console.log("batterSavingByTimeout" + percentage)
  # TODO: save battery
  charging: () ->
    # TODO: reset battery saving

batterSavingByBackgroundAdjustment =
  discharging: (battery) ->
    console.log("batterSavingByBackgroundAdjustment" + percentage)
#    # TODO: save battery
  charging: () ->
#  # TODO: reset battery saving

class BatterySavingFacade
  strategies: () ->
    @batterySavingStrategies ||= []
    @batterySavingStrategies
  add: (batterySavingStrategy) ->
    this.strategies().push batterySavingStrategy
  removeAll: () ->
    @batterySavingStrategies = []
  discharging: (battery) ->
    for strategy in this.strategies()
      strategy.charging()
  charging: (battery) ->
    for strategy in this.strategies()
      strategy.charging()
  count: () ->
    this.strategies().length

batterySavingFacade = new BatterySavingFacade()
batterySavingFacade.add(batterSavingByTimeout)
batterySavingFacade.add(batterSavingByBackgroundAdjustment)
console.log batterySavingFacade.count()

@batteryBackground ||= {}
@batteryBackground.batterySavingStrategy = batterySavingFacade
