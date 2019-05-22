import dom, jscore, strutils

type
  PixelUnit = tuple[value, color: string]

const
  C:PixelUnit = ("C", "255, 0, 0")
  B:PixelUnit = ("B", "100, 50, 0")
  S:PixelUnit = ("S", "255, 200, 150")
  O:PixelUnit = ("O", "0, 0, 255")
  Y:PixelUnit = ("Y", "255, 255, 0")
  W:PixelUnit = ("W", "255, 255, 255")
  _:PixelUnit = ("_", "229. 230, 232")
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
  ]

proc getRandomValue(): int = Math.floor(Math.random() * 256)

proc onPixelClick(value: string, ev: Event) =
  let newColor = join([getRandomValue(), getRandomValue(), getRandomValue()], " , ")
  let elementList = document.querySelectorAll("div[data-value='" & value & "']")
  for item in elementList:
    item.style.backgroundColor = "rgb(" & newColor & ")"

proc renderPixel(colData: PixelUnit): Element =
  let col = document.createElement("div")
  let value = colData.value
  col.setAttribute("data-value", value)
  col.style.backgroundColor = "rgb(" & colData.color & ")"
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
    for colData in rowData:
      row.appendChild(renderPixel(colData))
    root.appendChild(row)

proc main() =
  let root = document.createElement("div")
  root.style.background = "white"
  root.style.minHeight = "100vh"
  renderCanvas(root)
  document.body.appendChild(root)

proc onLoad(event: Event) =
  main()

window.onload = onLoad