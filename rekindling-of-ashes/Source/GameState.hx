// Store the state of the game
package;

import openfl.display.Sprite;
import worldMap.*;
import objects.*;

// Keep track of playing, loadscreens, etc.
enum State {
  PLAYING;
  LOADING;
}

class GameState {
  // State is initially loading
  public static var state:State = LOADING;

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
  public static var objectList:ObjectList;

  // Store and update map as part of the game state
  public static function updateMap(main:Sprite) {
    // Set the new tile map, collision map, and object list
    GameState.tileMap = worldMap.Maps.tileMaps[GameState.mapNumber];
    GameState.collisionMap = worldMap.Maps.collisionMaps[GameState.mapNumber];
    GameState.objectList = objects.Lists.objectLists[GameState.mapNumber];

    /* Initialize the tilemap by adding each Tile child to main. This isn't
    needed for the objectList, since that dynamically redraws itself to deal
    with stacking */
    GameState.tileMap.init(main);
  }
}