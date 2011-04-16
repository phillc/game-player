# now.ready(function(){
#   alert("hi");
# });
canvas = new fabric.Element "canvas", { backgroundColor : "black"}
canvas.setHeight window.innerHeight
canvas.setWidth window.innerWidth

rect = new fabric.Rect {
  top: 100,
  left: 100,
  width: 60,
  height: 70,
  fill: 'red'
}

canvas.add(rect)


Turn = Backbone.Model.extend({})
TurnCollection = Backbone.Collection.extend({
  model: Turn
})

