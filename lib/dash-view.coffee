{View} = require 'atom'

module.exports =
class DashView extends View
  @content: ->
    @div class: 'dash overlay from-top', =>
      @div "The Dash package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "dash:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "DashView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
