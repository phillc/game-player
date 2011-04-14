net = require('net')

server = net.createServer (socket) ->
  socket.addListener "connect", ->
    console.log "connected a tcp connection"
    socket.end("Hello World\n")


exports.run = (port) ->
  server.listen port
  console.log("TCP server listening on port %d.", server.address().port);
