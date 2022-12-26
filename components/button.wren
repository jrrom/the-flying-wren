import "graphics"   for Canvas, Color
import "input"      for Mouse, Keyboard

class Button {
  construct new(x, y, w, h, color, highlight, text, textX, textY, textColor, function) {
    _x         = x
    _y         = y
    _w         = w
    _h         = h
    _color     = color
    _highlight = highlight
    _text      = text
    _textX     = textX
    _textY     = textY
    _textColor = textColor
    _function  = function
    _newX      = _x - (_w / 2)
    _newY      = _y - (_h / 2)
  }

  draw() {
    if (((Mouse.x >= _newX) && (Mouse.x <= _newX + _w)) && ((Mouse.y >= _newY) && (Mouse.y <= _newY + _h))) {
      Canvas.rectfill(_newX, _newY, _w, _h, _highlight)
    } else {
      Canvas.rectfill(_newX, _newY, _w, _h, _color)
    }
    Canvas.print(_text, _textX, _textY, _textColor)
  }

  update() {
    if ((Mouse.isButtonPressed("left") && ((Mouse.x >= _newX) && (Mouse.x <= _newX + _w)) && ((Mouse.y >= _newY) && (Mouse.y <= _newY + _h))) || Keyboard["Space"].justPressed) {
      _function.call()
    }
  }
}