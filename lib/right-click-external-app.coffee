{CompositeDisposable} = require 'atom'

module.exports =
  activate: ->
    @disposables = new CompositeDisposable()
    openFile = @openFile.bind(this)
    @disposables.add atom.commands.add ".tree-view .file", "right-click-external-app:open", openFile

  openFile: ({target}) ->
    filePath = target.dataset.path
    return unless filePath
    shell = require('electron').shell
    shell.openPath(filePath).then (message) ->
      if message != ""
        console.log("Could not open file: " + message)
      else
        console.log("Success opening: " + filePath)
