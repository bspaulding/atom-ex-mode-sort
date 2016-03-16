caseSensitiveSorter = (a, b) -> a >= b
caseInsensitiveSorter = (a, b) -> a.toLowerCase() >= b.toLowerCase()

module.exports = AtomExModeSort =
  activate: (state) ->
    atom.packages.onDidActivatePackage (pack) ->
      if pack.name == 'ex-mode'
        pack.mainModule.provideEx().registerCommand 'sort', AtomExModeSort.sort

  sort: (args) ->
    isCaseInsensitive = (args.args || "").trim() == "i"
    editor = args.editor
    selection = editor.getSelectedText()
    sorted = selection
      .split("\n")
      .filter((x) -> x.length != 0)
      .sort(if isCaseInsensitive then caseInsensitiveSorter else caseSensitiveSorter)
      .join("\n")
      .concat("\n")
    editor.insertText(sorted)
