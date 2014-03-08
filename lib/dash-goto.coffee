{View} = require 'atom'
DashErrorView = require './dash-error-view'
{exec} = require('child_process')

module.exports =
class DashGoto
  languageMap: {
    "Ruby"         : "ruby",
    "CoffeeScript" : "coffee",
    "JavaScript"   : "javascript",
  }

  constructor: (serializeState) ->
    atom.workspaceView.command "dash:lookup", => @lookup()
    @errorView = new DashErrorView(serializeState)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @errorView.detach()

  lookup: ->
    editor = atom.workspace.getActiveEditor()
    search = editor.getWordUnderCursor()
    grammar = editor.getGrammar()
    grammarName = if grammar == atom.syntax.nullGrammar then "Plain Text" else grammar.name
    if !search
      @errorView.show("No word under cursor")
    else if dashLangName = @languageMap[grammarName]
      @openDash("#{dashLangName}:#{search}")
    else
      @errorView.show("No dash docset mapped for #{grammarName}")

  openDash: (query)->
    dashCmd = "open dash://#{query}"
    child = exec dashCmd, (error, stdout, stderr) ->
      if error
        console.log('dash exec error: ' + error)
        @errorView.show("Error running Dash, see console")
