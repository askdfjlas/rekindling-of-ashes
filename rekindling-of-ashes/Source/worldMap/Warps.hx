// Deal with exits leading the player to different maps
package worldMap;

import openfl.display.Sprite;
import Global.*;
import GameState.State;

class Warps {
  /* Warp points are hashmaps with [String of concatenated coordinates =>
  [new x in tiles, new y in tiles, new map number]
  There is are warp points per each room */
  private static var warpsList:Array<Map<String, Array<Int>>>  = [
    [''=> []], // First test map
    ["71"=> [7, 1, 2]],  // Bedroom
    ["81"=> [7, 2, 1]]  // Living room
  ];

  public static function warp() {
    var currentWarps = Warps.warpsList[GameState.mapNumber];  // Get current list of warps
    var key = '${GameState.xt}${GameState.yt}';  // Key is concatenated coordinates
    var newTriple = currentWarps[key];  // Triple of [new x, new y, room number]
    GameState.state = LOADING;  // Set state to loading

    // Init new player position
    GameState.xt = newTriple[0];
    GameState.yt = newTriple[1];
    GameState.x = newTriple[0]*TILESIZE;
    GameState.y = newTriple[1]*TILESIZE;
    GameState.mapNumber = newTriple[2];  // Update map number
  }
}