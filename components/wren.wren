import "graphics" for Canvas, Color, ImageData
import "input"    for Mouse, Keyboard
import "math"     for Vector

class Wren {
  construct new(x, y) {
    _x           = x
    _y           = y

    _partX       = 0
    _sprite      = 0
    _topLeft     = Vector.new(_x, _y + 1) 
    _topRight    = Vector.new(_x + 15, _y + 1)
    _bottomLeft  = Vector.new(_x, _y + 12 - 1)
    _bottomRight = Vector.new(_x + 15, _y + 12 - 1) 

    _velocity    = 0
    _wrenSheet   = ImageData.loadFromFile("./assets/bird-sheet.png")
  }

  update(change) {
    _y = _y + change
  }

  getY() {
    return _y
  }

  draw() {
    if (_partX > 56) {
      _partX = 0
    } else if (_partX % 15 == 0) {
        _sprite   = _wrenSheet.transform({
        "srcX": _partX, "srcY": 0,
        "srcW": 15, "srcH": 12 
      })
    }
    _partX = _partX + 1
    _sprite.draw(_x, _y)
    _topLeft     = Vector.new(_x, _y + 1) 
    _topRight    = Vector.new(_x + 15, _y + 1)
    _bottomLeft  = Vector.new(_x, _y + 12 - 1)
    _bottomRight = Vector.new(_x + 15, _y + 12 - 1) 
  }

  body() {
    return {
      "topLeft"    : _topLeft,
      "topRight"   : _topRight,
      "bottomLeft" : _bottomLeft,
      "bottomRight": _bottomRight,
    }
  }
}