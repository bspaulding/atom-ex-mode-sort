AtomExModeSort = require '../lib/atom-ex-mode-sort'

class MockEditor
  constructor: (@text) ->

  getText: () ->
    @text

  getSelectedText: () ->
    @text

  insertText: (text) ->
    @text = text

describe "AtomExModeSort", ->
  describe "sort", ->
    it "is case sensitive by default", ->
      editor = new MockEditor("hello\navery\nChild\n")
      AtomExModeSort.sort({ editor })
      expect(editor.getText()).toBe("Child\navery\nhello\n")

    it "is case insensitive if 'i' flag is passed", ->
      editor = new MockEditor("hello\navery\nChild\n")
      AtomExModeSort.sort({ editor, args: " i" })
      expect(editor.getText()).toBe("avery\nChild\nhello\n")
