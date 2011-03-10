express = require 'express'
net = require('net')

app = express.createServer()
app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyDecoder()
  app.use express.methodOverride()
  app.use app.router
  app.use express.staticProvider(__dirname + '/public')

app.configure 'development', ->
  app.use express.errorHandler({ dumpExceptions: true, showStack: true })

app.configure 'production', ->
  app.use express.errorHandler()

app.get '/', (req, res) -> 
  res.render 'index'

app.listen(3000)

console.log("Express server listening for web traffic on port %d", app.address().port)

io = require 'socket.io'
socket = io.listen app
socket.on 'connection', (client) ->
  console.log "connection made"
  client.on 'disconnect', ->
    console.log "disconnected"
  client.on 'message', (data) ->
    console.log "received " + data
    



server = net.createServer (socket) ->
  socket.addListener "connect", ->
    console.log "connected a tcp connection"
    socket.end("Hello World\n")

server.listen(4000)
console.log("TCP server listening on port 7000.");