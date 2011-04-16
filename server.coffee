net = require('net')

class LoggingIn
  constructor: (@bot) ->
    
  handle_input: (socket, data) ->
    if data[0..3] == "USER"
      parsed = data.match(/^USER (.*) PASS (.*)\s*$/)
      if parsed
        @bot.username = parsed[1]
        @bot.password = parsed[2]
      else
        @bot.username = data.match(/^USER (.*)\s*$/)[1]
      @bot.state = new WaitingForGame(@bot)
      socket.write "INFO Logged in as " + @bot.username + "\n"

class WaitingForGame
  constructor: (@bot) ->
    
  handle_input: (socket, data) ->
    
    
class Bot
  constructor: ->
    @state = new LoggingIn(this)
  
  handle_input: (socket, data) ->
    @state.handle_input socket, data

server = net.createServer (socket) ->
  socket.setEncoding()
  bot = new Bot
  socket.addListener "connect", ->
    console.log "connected a tcp connection"
  socket.addListener "data", (data) ->
    console.log("received: " + data)
    bot.handle_input socket, data
  socket.addListener "end", (data) ->
    console.log("client disconnected: " + bot.username)

exports.run = (port) ->
  server.listen port
  console.log("TCP server listening on port %d.", server.address().port);
