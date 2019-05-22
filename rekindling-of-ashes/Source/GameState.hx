// Store the state of the game
package;

import openfl.display.Sprite;
import worldMap.*;

class GameState {
  // Player object
  public static var vs:Player;

  // Player position in pixels
  public static var x:Int = 32;
  public static var y:Int = 64;

  // Player position in tiles
  public static var xt:Int = 1;
  public static var yt:Int = 2;

  // Current tilemap the player is on
  public static var mapNumber:Int = 1;
  public static var tileMap:TileMap;
  public static var collisionMap:CollisionMap;

  // Store and update map as part of the game state
  public static function updateMap(main:Sprite) {
    GameState.tileMap = worldMap.Maps.tileMaps[GameState.mapNumber];
    GameState.collisionMap = worldMap.Maps.collisionMaps[GameState.mapNumber];
    GameState.tileMap.init(main);
  }
}