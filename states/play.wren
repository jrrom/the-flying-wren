import "graphics"           for Canvas, Color, ImageData
import "input"              for Keyboard
import "./components/wren"  for Wren 
import "./components/pipe"  for Pipe

class Play {
  x=(value) {_x = value}
  stateManager=(value) {_stateManager = value}

  construct new() {
    _background   = ImageData.loadFromFile("./assets/background.png")
    _wren         = Wren.new(40, 77)
    _wrenBody     = _wren.body()
  }

  init() {
    _pipe         = Pipe.new(300, 50, _stateManager.speedInstance)
    _wren         = Wren.new(40, 77)
    _wrenBody     = _wren.body()
    _speedVar     = _stateManager.speedInstance 
    _game         = _stateManager.gameInstance
    _startMenuVar = _stateManager.startMenuInstance
    _speedVar.reset(0.5, 0.005)
  }

  update() {
    _x              = _x + _speedVar.getSpeed() 
    _startMenuVar.x = _x
    _pipe.help      = _x

    if (_x > 743) {
      _x         = 0
      _pipe.help = 0
    }

    if (Keyboard.isButtonPressed("Up")) {
      _wren.update(-2)
    } else if (Keyboard.isButtonPressed("Down")) {
      _wren.update(2)
    }

    // Out-of-bounds / Collision checking

    if (_wren.getY() > 144 || _wren.getY() < -5) {
      this.setX()
    }
    

    // Pipe
    if ((_wrenBody["topLeft"].x >= _pipe.topLeft.x && _pipe.bottomRight.x >= _wrenBody["topLeft"].x) && (_wrenBody["topLeft"].y >= _pipe.topLeft.y && _pipe.bottomRight.y >= _wrenBody["topLeft"].y)) {
      this.setX()
    }
    if ((_wrenBody["topRight"].x >= _pipe.topLeft.x && _pipe.bottomRight.x >= _wrenBody["topRight"].x) && (_wrenBody["topRight"].y >= _pipe.topLeft.y && _pipe.bottomRight.y >= _wrenBody["topRight"].y)) {
      this.setX()
    }
    if ((_wrenBody["bottomLeft"].x >= _pipe.topLeft.x && _pipe.bottomRight.x >= _wrenBody["bottomLeft"].x) && (_wrenBody["bottomLeft"].y >= _pipe.topLeft.y && _pipe.bottomRight.y >= _wrenBody["bottomLeft"].y)) {
      this.setX()
    }
    if ((_wrenBody["bottomRight"].x >= _pipe.topLeft.x && _pipe.bottomRight.x >= _wrenBody["bottomRight"].x) && (_wrenBody["bottomRight"].y >= _pipe.topLeft.y && _pipe.bottomRight.y >= _wrenBody["bottomRight"].y)) {
      this.setX()
    }

    // UDownPipe
    if ((_wrenBody["topLeft"].x >= _pipe.uDownPipeTopLeft.x && _pipe.uDownPipeBottomRight.x >= _wrenBody["topLeft"].x) && (_wrenBody["topLeft"].y >= _pipe.uDownPipeTopLeft.y && _pipe.uDownPipeBottomRight.y >= _wrenBody["topLeft"].y)) {
      this.setX()
    }
    if ((_wrenBody["topRight"].x >= _pipe.uDownPipeTopLeft.x && _pipe.uDownPipeBottomRight.x >= _wrenBody["topRight"].x) && (_wrenBody["topRight"].y >= _pipe.uDownPipeTopLeft.y && _pipe.uDownPipeBottomRight.y >= _wrenBody["topRight"].y)) {
      this.setX()
    }
    if ((_wrenBody["bottomLeft"].x >= _pipe.uDownPipeTopLeft.x && _pipe.uDownPipeBottomRight.x >= _wrenBody["bottomLeft"].x) && (_wrenBody["bottomLeft"].y >= _pipe.uDownPipeTopLeft.y && _pipe.uDownPipeBottomRight.y >= _wrenBody["bottomLeft"].y)) {
      this.setX()
    }
    if ((_wrenBody["bottomRight"].x >= _pipe.uDownPipeTopLeft.x && _pipe.uDownPipeBottomRight.x >= _wrenBody["bottomRight"].x) && (_wrenBody["bottomRight"].y >= _pipe.uDownPipeTopLeft.y && _pipe.uDownPipeBottomRight.y >= _wrenBody["bottomRight"].y)) {
      this.setX()
    }

    _pipe.update()
    _wrenBody = _wren.body()
  }

  setX() {
    _startMenuVar.x = _x
    _game.changeState(_startMenuVar)
  }

  draw(dt) {
    Canvas.cls(Color.blue)
    _background.drawArea(_x, 0, 256, 144, 0, 0)

    _wren.draw()
    _pipe.draw()

    Canvas.print(_pipe.getScore(), 10, 10, Color.white)
  }
}