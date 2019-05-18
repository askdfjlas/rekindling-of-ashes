// TileMap class - implemented as a 2D array of Tiles
package worldMap;

import openfl.display.Sprite;
import openfl.display.Stage;
import Global.*;

class TileMap {
  /* Pre-calculate number of tiles to the left and right of the midpoint, used
  for faster rendering */
  private static var HTILEDEPTH:Int = Math.ceil(XCENTER/TILESIZE) + 1;
  private static var VTILEDEPTH:Int = Math.ceil(YCENTER/TILESIZE) + 1;

  // 2D array of tiles to store the map
  public var mapArray:Array<Array<Tile>> = [];

  // Render the tilemap
  public function render() {
    /* First create the range of tiles to update the position of; this
    is an optimization which prevents offscreen tiles from being redrawn.
    The result is a rectangular area defined by 4 endpoints in the array. */
    var xEndpointL:Int = Std.int(Math.max(0, GameState.xt - HTILEDEPTH));
    var xEndpointR:Int = Std.int(Math.min(this.mapArray[0].length,
      GameState.xt + HTILEDEPTH + 1
    ));
    var yEndpointU:Int = Std.int(Math.max(0, GameState.yt - VTILEDEPTH));
    var yEndpointD:Int = Std.int(Math.min(this.mapArray.length,
      GameState.yt + VTILEDEPTH + 1
    ));

    // Then update the positions of all tiles witihin that rectangle
    // Position of the "printer"
    var yPos:Int = yEndpointU*TILESIZE;
    var xPos:Int;
    // Update the locations of the tiles in the range
    for(i in yEndpointU...yEndpointD) {
      xPos = xEndpointL*TILESIZE;
      for(j in xEndpointL...xEndpointR) {
        var tile = this.mapArray[i][j];  // Current tile
        tile.update(xPos - GameState.x + XCENTER, yPos - GameState.y + YCENTER);
        xPos += TILESIZE;
      }
      yPos += TILESIZE;
    }
  }

  // Initially place all tiles on screen
  public function init(main:Sprite) {
    // Iterate over 2D array, drawing each tile individually
    for(row in mapArray) {
      for(tile in row) {
        tile.init(main);
      }
    }
  }

  public function new(numberArray:Array<Array<Int>>) {
    // Convert numeric array to Tile Array
    for(row in numberArray) {
      var currentRow:Array<Tile> = [];

      for(v in row) {
        currentRow.push(new Tile(v));  // Add a tile
      }
      mapArray.push(currentRow);  // Push the current row
    }
  }
}