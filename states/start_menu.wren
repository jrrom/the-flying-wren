import "graphics"            for Canvas, Color, ImageData
import "./components/button" for Button

class StartMenu {
  x=(value) {_x = value}
  stateManager=(value) {_stateManager = value}

  construct new(x) {
    _buttonInstance  = Button.new(128, 77, 40, 9, Color.green, Color.darkgreen, "Start", 109, 73.5, Color.white, Fn.new { _stateManager.gameInstance.changeState(_stateManager.playInstance) })
    _backgroundImage = ImageData.loadFromFile("./assets/background.png")
    _x               = x
  }

  init() {}

  update() {
    _x = _x + 0.5 
    if (_x > 743) {
      _x = 0
    }

    _stateManager.playInstance.x = _x
    _buttonInstance.update()
  }

  draw(dt) {
    Canvas.cls(Color.blue)
    _backgroundImage.drawArea(_x, 0, 256, 144, 0, 0)
    _buttonInstance.draw()
  }
}