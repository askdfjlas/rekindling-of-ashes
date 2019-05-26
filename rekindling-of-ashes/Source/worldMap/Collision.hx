// Deal with collisions and any other tile interactions
package worldMap;

import Global.MoveState;

// Types of collision tiles
enum CollisionType {
  PASS;
  WALL;
  WARP;
}

class Collision {
  // Return the collision type of the seeked tile
  private static function getCollisionType(x:Int, y:Int):CollisionType {
    var map = GameState.collisionMap.mapArray;

    // If seeking an out of bounds tile
    if(x < 0 || x >= map[0].length || y < 0 || y >= map.length) {
      return WALL;
    }
    else {
      return map[y][x];
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