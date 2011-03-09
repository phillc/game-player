(function() {
  var socket;
  $("#selectable").selectable();
  $("#bot_choose}").dialog();
  socket = new io.Socket();
  socket.connect();
  socket.on('connect', function() {});
  socket.on('message', function() {});
  socket.on('disconnect', function() {});
}).call(this);
