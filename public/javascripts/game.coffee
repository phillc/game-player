# now.ready(function(){
#   alert("hi");
# });
canvas = new fabric.Element "canvas"

rect = new fabric.Rect {
  top: 100,
  left: 100,
  width: 60,
  height: 70,
  fill: 'red'
}

canvas.add(rect)
