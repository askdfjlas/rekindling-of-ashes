// Deal with exits leading the player to different maps
package worldMap;

import openfl.display.Sprite;
import Global.*;
import GameState.State;

class Warps {
  // Set player animation when entering a new region
  private static var ANIM_MAP:Map<Int, String> =
    [-1=> 'S', 0=> 'U', 1=> 'D', 2=> 'L', 3=> 'R'];

  /* Warp points are hashmaps with [String of concatenated coordinates =>
  [new x in tiles, new y in tiles, new map number, animation number]
  There are warp points per each room */
  private static var warpsList:Array<Map<String, Array<Int>>>  = [
    [''=> []], // First test map
    ["7 1"=> [9, 2, 2, 2]],  // Bedroom
    ["10 2"=> [7, 2, 1, 1]]  // Living room
  ];

  // Player steps on a warp, like a door
  public static function warp() {
    var currentWarps = Warps.warpsList[GameState.mapNumber];  // Get current list of warps
    var key = '${GameState.xt} ${GameState.yt}';  // Key is concatenated coordinates
    var newQuad = currentWarps[key];  // Quad of [new x, new y, room number, animation]
    GameState.state = LOADING;  // Set state to loading

    // Init new player position
    GameState.xt = newQuad[0];
    GameState.yt = newQuad[1];
    GameState.x = newQuad[0]*TILESIZE;
    GameState.y = newQuad[1]*TILESIZE;
    GameState.mapNumber = newQuad[2];  // Update map number
    GameState.bufferedAnim = ANIM_MAP[newQuad[3]];  // Buffer animation state
  }
}