# Package

version       = "0.1.0"
author        = "linychuo"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
binDir        = "dist"
backend       = "js"

bin           = @["preact_pixel.js"]

# Dependencies

requires "nim >= 0.19.0"
