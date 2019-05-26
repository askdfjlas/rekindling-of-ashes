// CollisionMap class, similar to TileMap but without rendering functions
package worldMap;

import worldMap.Collision.CollisionType;

class CollisionMap {
  // 2D array of CollisionType objects
  public var mapArray:Array<Array<CollisionType>> = [];

  public function new(numberArray:Array<Array<Int>>) {
    // Convert numeric array to CollisionType array
    for(row in numberArray) {
      var currentRow:Array<CollisionType> = [];

      for(v in row) {
        switch(v) {
          // Passable tile
          case 0:
            currentRow.push(PASS);
          // Wall/collision tile
          case 1:
            currentRow.push(WALL);
          // Warp to another map
          case 2:
            currentRow.push(WARP);
          // If the input array is messed up, consider anything else as passable
          default:
            currentRow.push(PASS);
        }
      }
      this.mapArray.push(currentRow);
    }
  }
}