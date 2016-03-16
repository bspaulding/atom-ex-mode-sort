activateExMode = ->
  atom.workspace.open().then ->
    atom.commands.dispatch(atom.views.getView(atom.workspace), 'ex-mode:open')
    keydown('escape')
    atom.workspace.getActivePane().destroyActiveItem()

getEditorElement = (callback) ->
  textEditor = null

  waitsForPromise ->
    atom.workspace.open().then (e) ->
      textEditor = e

  runs ->
    element = atom.views.getView(textEditor)
    callback(element)

module.exports = {
	activateExMode,
	getEditorElement,
	keydown
}
