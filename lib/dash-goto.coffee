{View} = require 'atom'
DashErrorView = require './dash-error-view'

module.exports =
class DashGoto
  constructor: (serializeState) ->
    atom.workspaceView.command "dash:lookup", => @lookup()
    @errorView = new DashErrorView(serializeState)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @errorView.detach()

  lookup: ->
    console.log "DashView was toggled!"
    @errorView.show()
