{View} = require 'atom'

module.exports =
class DashErrorView extends View
  @content: ->
    @div class: 'dash dash-error-box overlay from-top', =>
      @div "The Dash package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->


  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  show: ->
    console.log "DashErrorView was called!"
    console.log this
    atom.workspaceView.append(this)
    setTimeout @hide, 2000

  hide: =>
    console.log "Going to drop this"
    @detach()
