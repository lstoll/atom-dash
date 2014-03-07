DashGoto = require './dash-goto'

module.exports =
  dashGoto: null

  activate: (state) ->
    console.log "Activate"
    @dashGoto = new DashGoto(state.dashViewState)
    console.log @dashGoto

  deactivate: ->
    @dashGoto.destroy()

  serialize: ->
    dashViewState: @dashGoto.serialize()
