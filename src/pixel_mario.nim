import dom, strtabs, jscore, strutils

const
  C = "C"
  B = "B"
  S = "S"
  O = "O"
  Y = "Y"
  W = "W"
  _ = "_"
  pixelData = [
    [_, _, _, _, _, _, _, _, _, _, _, _, _, _],
    [_, _, _, _, C, C, C, C, C, _, _, _, _, _],
    [_, _, _, C, C, C, C, C, C, C, C, C, _, _],
    [_, _, _, B, B, B, S, S, B, S, _, _, _, _],
    [_, _, B, S, B, S, S, S, B, S, S, S, _, _],
    [_, _, B, S, B, B, S, S, S, B, S, S, B, _],
    [_, _, B, B, S, S, S, S, B, B, B, B, _, _],
    [_, _, _, _, S, S, S, S, S, S, S, _, _, _],
    [_, _, _, C, C, O, C, C, O, C, _, _, _, _],
    [_, _, C, C, C, O, C, C, O, C, C, C, _, _],
    [_, C, C, C, C, O, O, O, O, C, C, C, C, _],
    [_, W, W, C, O, Y, O, O, Y, O, C, W, W, _],
    [_, W, W, W, O, O, O, O, O, O, W, W, W, _],
    [_, W, W, O, O, O, O, O, O, O, O, W, W, _],
    [_, _, _, O, O, O, _, _, O, O, O, _, _, _],
    [_, _, B, B, B, _, _, _, _, B, B, B, _, _],
    [_, B, B, B, B, _, _, _, _, B, B, B, B, _]
  ];

let colors = newStringTable()
colors[C] = "255, 0, 0"
colors[B] = "100, 50, 0"
colors[S] = "255, 200, 150"
colors[O] = "0, 0, 255"
colors[Y] = "255, 255, 0"
colors[W] = "255, 255, 255"
colors[_] = "229, 230, 232"

var root:Element

proc main()

proc getRandomValue(): int = Math.floor(Math.random() * 256)

proc onPixelClick(value: string, ev: Event) =
  colors[value] = join([getRandomValue(), getRandomValue(), getRandomValue()], " , ")
  document.body.removeChild(root)
  main()

proc renderPixel(value: string): Element =
  let col = document.createElement("div")
  col.style.backgroundColor = "rgb(" & colors[value] & ")"
  col.style.width = "20px"
  col.style.height = "20px"
  col.style.display = "inline-block"
  col.addEventListener("click", proc(ev: Event) =
    onPixelClick(value, ev)
  )
  return col

proc renderCanvas(root: Element) =
  for rowData in pixelData:
    let row = document.createElement("div")
    row.style.height = "20px"
    for col in rowData:
      row.appendChild(renderPixel(col))
    root.appendChild(row)

proc main() =
  root = document.createElement("div")
  root.style.background = "white"
  root.style.minHeight = "100vh"
  renderCanvas(root)
  document.body.appendChild(root)

proc onLoad(event: Event) =
  main()

window.onload = onLoad