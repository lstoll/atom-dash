DashView = require './dash-view'

module.exports =
  dashView: null

  activate: (state) ->
    @dashView = new DashView(state.dashViewState)

  deactivate: ->
    @dashView.destroy()

  serialize: ->
    dashViewState: @dashView.serialize()
