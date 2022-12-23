import "./states/startmenu" for StartMenu
import "./states/game"      for Game
import "./states/play"      for Play
import "./states/speed"     for Speed

class StateManager {
  startMenuInstance=(value) {_startMenuInstance = value}
  gameInstance=(value) {_gameInstance = value}
  playInstance=(value) {_playInstance = value}
  speedInstance=(value) {_speedInstance = value}

  startMenuInstance {_startMenuInstance}
  gameInstance      {_gameInstance}
  playInstance      {_playInstance}
  speedInstance     {_speedInstance}

  construct new(startMenuInstance, gameInstance, playInstance, speedInstance) {
    _startMenuInstance = startMenuInstance
    _gameInstance      = gameInstance 
    _playInstance      = playInstance
    _speedInstance     = speedInstance
  }
}

var startMenu = StartMenu.new(0)
var game      = Game.new(startMenu)
var play      = Play.new()
var speed     = Speed.new(0.5, 0.005)

var stateManager = StateManager.new(startMenu, game, play, speed)

stateManager.startMenuInstance.stateManager = stateManager
stateManager.gameInstance.stateManager      = stateManager
stateManager.playInstance.stateManager      = stateManager