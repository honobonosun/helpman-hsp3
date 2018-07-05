module.exports =

  getEditor: ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?
    return unless editor.isEmpty()?
    editor

  getToken: (editor) ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?
    token = editor.tokenForBufferPosition(editor.getCursorBufferPosition())
    return unless token?.value
    token

  # エディタの言語スコープが'source.hsp3'ならtrueを返す。
  checkScope: (editor) ->
    if editor.getRootScopeDescriptor().scopes[0] is 'source.hsp3'
      return true
    else
      return false

  openHelpman: (keyword) ->
    Config = require './config'
    require('child_process').execFile(
      Config.get.path(),
      ["#{keyword}"],
      (err, stdout, stderr)->
        if err
          atom.notifications.addError(
            "not be executed. (helpman-hsp3)",
            {
              detail: "The file you attempted to execute is
                        \"#{Config.get.path()}\""
              dismissable: true

            }
          )
    )
    return

  search: ->
    editor = @getEditor()
    return unless editor?
    return unless @checkScope(editor) is true

    # 選択されている文字を優先する。
    selText = editor.getSelectedText()
    if selText is ''
      @openHelpman @getToken().value
    else
      @openHelpman selText
