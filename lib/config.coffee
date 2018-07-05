module.exports =
  config:
    HelpmanPath:
      description: 'Please set **helpman.exe** full path.'
      type: 'string'
      default: 'C:/hsp35/hsphelp/helpman.exe'
  get:
    path: ->
      atom.config.get('helpman-hsp3.HelpmanPath')
