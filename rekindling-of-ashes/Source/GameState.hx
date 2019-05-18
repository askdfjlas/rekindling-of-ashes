// Store the state of the game
package;

import openfl.display.Sprite;
import worldMap.*;

class GameState {
  // Player object
  public static var vs:Player;

  // Player position in pixels
  public static var x:Int = 0;
  public static var y:Int = 0;

  // Player position in tiles
  public static var xt:Int = 0;
  public static var yt:Int = 0;

  // Current tilemap the player is on
  public static var mapNumber:Int = 0;
  public static var tileMap:TileMap;

  // Store and update map as part of the game state
  public static function updateMap(main:Sprite) {
    GameState.tileMap = worldMap.Maps.tileMaps[GameState.mapNumber];
    GameState.tileMap.init(main);
  }
}