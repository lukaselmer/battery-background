class BatterSavingByTimeout
  discharging: (battery) ->
    console.log("batterSavingByTimeout" + percentage)
  # TODO: save battery
  charging: () ->
    # TODO: reset battery saving

class BatterSavingByBackgroundAdjustment
  discharging: (battery) ->
    console.log("batterSavingByBackgroundAdjustment" + percentage)
#    # TODO: save battery
  charging: () ->
#  # TODO: reset battery saving

class BatterySavingFacade
  constructor: () ->
    this.init()
  init: () ->
    this.add(new BatterSavingByTimeout())
    this.add(new BatterSavingByBackgroundAdjustment())
  strategies: () ->
    @batterySavingStrategies ||= []
    @batterySavingStrategies
  add: (batterySavingStrategy) ->
    this.strategies().push batterySavingStrategy
  removeAll: () ->
    @batterySavingStrategies = []
  discharging: (battery) ->
    for strategy in this.strategies()
      strategy.discharging(battery)
  charging: (battery) ->
    for strategy in this.strategies()
      strategy.charging(battery)
  count: () ->
    this.strategies().length

batterySavingFacade = new BatterySavingFacade()
console.log batterySavingFacade.count()

@batteryBackground ||= {}
@batteryBackground.batterySavingStrategy = batterySavingFacade
