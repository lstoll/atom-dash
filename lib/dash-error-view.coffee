{View} = require 'atom'

module.exports =
class DashErrorView extends View
  @content: ->
    @div class: 'dash dash-error-box overlay from-top', =>
      @div "", class: "message"

  initialize: (serializeState) ->

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  show: (message) ->
    @message = message
    atom.workspaceView.append(this)
    this.children('.dash .message').html(@message)
    setTimeout @hide, 2000

  hide: =>
    @detach()
