import "graphics"           for Canvas, Color
import "dome"               for Process, Window
import "input"              for Keyboard, DigitalInput

class Game {
  stateManager=(value) {_stateManager = value}

  construct new(state) {
    _state = state
  }

  init() {
    Window.title = "The Flying Wren"
    Window.vsync = true 
    Window.resize(256, 144)
    Canvas.resize(256, 144)
  }

  update() {
    _state.update()
    if (Keyboard["f11"].justPressed) {
      Window.fullscreen = !Window.fullscreen 
    }
  }

  draw(dt) {
    _state.draw(dt)
  }

  changeState(state) {
    _state = state
    _state.init()
  }
}
