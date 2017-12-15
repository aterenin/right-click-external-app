{CompositeDisposable} = require 'atom'

module.exports =
  activate: ->
    @disposables = new CompositeDisposable()
    openFile = @openFile.bind(this)
    @disposables.add atom.commands.add ".tree-view .file", "right-click-external-app:open", openFile

  openFile: ({target}) ->
    filePath = target.dataset.path
    return unless filePath
    shell = require('shell')
    shell.openItem(filePath)
