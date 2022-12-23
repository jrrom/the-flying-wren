class Speed {
  speed=(value) {_speed = value}

  construct new(speed, increment) {
    _speed     = speed
    _increment = increment
  }

  getSpeed() {
    return _speed
  }

  increment() {
    _speed = _speed + _increment
  }

  reset(speed, increment) {
    _speed     = speed
    _increment = increment
  }
}