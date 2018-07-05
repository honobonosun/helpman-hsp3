Model = require './model'
Config = require './config'

module.exports =

  config: Config.config

  activate: (state) ->
    atom.commands.add 'atom-workspace','helpman-hsp3:search': ->
      Model.search()
      return
    return
