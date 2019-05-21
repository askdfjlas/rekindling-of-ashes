// Deal with collisions and any other tile interactions
package worldMap;

import Global.MoveState;

// Types of tiles
enum CollisionType {
  PASS;
  WALL;
}

class Collision {
  // Tile types hashed to collision types
  private static var collisionMap =
  [0=>WALL, 1=>PASS, 2=>PASS, 3=>PASS, 4=>WALL, 5=>PASS, 6=>PASS, 7=>WALL,
  8=>WALL];

  // Return the collision type of the seeked tile
  private static function getCollisionType(x:Int, y:Int):CollisionType {
    var map = GameState.tileMap.mapArray;

    // If seeking an out of bounds tile
    if(x < 0 || x >= map[0].length || y < 0 || y >= map.length) {
      return WALL;
    }
    else {
      var tile = map[y][x];
      return Collision.collisionMap[tile.type];
    }
  }

  public static function collide(direction:MoveState):CollisionType {
    // x and y in tile coordinates of the seeked tile
    var xt = GameState.xt;
    var yt = GameState.yt;
    // The seeked tile varies depending on which direction the player is facing
    switch(direction) {
      case UP:
        yt--;
      case DOWN:
        yt++;
      case LEFT:
        xt--;
      case RIGHT:
        xt++;
      case STOP:  // For compilation
      case STUCK:
    }

    return Collision.getCollisionType(xt, yt);
  }
}