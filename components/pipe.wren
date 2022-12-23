import "graphics"       for Canvas, Color, ImageData
import "random"         for Random
import "math"           for Vector
import "audio"          for AudioEngine
var RandomVar = Random.new()
var audio     = AudioEngine.load("win", "assets/win.wav")

class Pipe {
  help=(value)    {_help = value}
  topLeft     {_PipeTopLeft}
  topRight    {_PipeTopRight}
  bottomLeft  {_PipeBottomLeft}
  bottomRight {_PipeBottomRight}

  uDownPipeTopLeft     {_UDownPipeTopLeft}
  uDownPipeTopRight    {_UDownPipeTopRight}
  uDownPipeBottomLeft  {_UDownPipeBottomLeft}
  uDownPipeBottomRight {_UDownPipeBottomRight}

  construct new(x, height, SpeedVar) {
    _x                    = x
    _randomX              = x
    _height               = height 
    _randomHeight         = height
    _dist                 = 24 
    _SpeedVar             = SpeedVar
    _Score                = 0

    _Pipe                 = ImageData.loadFromFile("./assets/pipe.png")
    _PipeTopLeft          = Vector.new(_x, _height)
    _PipeTopRight         = Vector.new(_x + 30, _height)
    _PipeBottomLeft       = Vector.new(_x, _height + 144)
    _PipeBottomRight      = Vector.new(_x + 30, _height + 144)

    _UDownPipe            = _Pipe.transform({ "angle": 180 })
    _UDownPipeTopLeft     = Vector.new(_x, (-144 + _height) - _dist)
    _UDownPipeTopRight    = Vector.new(_x + 30, (-144 + _height) - _dist)
    _UDownPipeBottomLeft  = Vector.new(_x, _height - _dist)
    _UDownPipeBottomRight = Vector.new(_x + 30, _height - _dist)
  }

  update() {
    _x    = _x - 2 - _SpeedVar.getSpeed()
    _PipeTopLeft          = Vector.new(_x, _height)
    _PipeTopRight         = Vector.new(_x + 30, _height)
    _PipeBottomLeft       = Vector.new(_x, _height + 144)
    _PipeBottomRight      = Vector.new(_x + 30, _height + 144)

    _UDownPipeTopLeft     = Vector.new(_x, (-144 + _height) - _dist)
    _UDownPipeTopRight    = Vector.new(_x + 30, (-144 + _height) - _dist)
    _UDownPipeBottomLeft  = Vector.new(_x, _height - _dist)
    _UDownPipeBottomRight = Vector.new(_x + 30, _height - _dist)

    if (_x < -30) {
      this.randomize()
      _x      = _randomX
      _height = _randomHeight
    }
  }

  draw() {
    _Pipe.draw(_x, _height)
    _UDownPipe.draw(_x, (-144 + _height) - _dist)
  }

  randomize() {
    _randomX      = RandomVar.int(256, 356)
    _randomHeight = RandomVar.int(40, 104)
    if (_randomHeight >= _height + 20 || _randomHeight <= _height - 20) {
      _Score = _Score + 1
      var channel = AudioEngine.play("win")
      channel.stop()
      _SpeedVar.increment()
      return
    } else {
      this.randomize()
    }
  }

  getX() {
    return _x
  }

  getHelp() {
    return _help
  }

  getScore() {
    return _Score
  }

  getHeight() {
    return _height
  }
}