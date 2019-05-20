import dom

proc onLoad(event: Event) =
  let main = document.createElement("p")
  main.innerHTML = "hello"
  document.body.appendChild(main)

window.onload = onLoad