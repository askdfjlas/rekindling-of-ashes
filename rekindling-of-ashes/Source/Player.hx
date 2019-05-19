// Class for player-related entities
package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.Stage;
import openfl.Assets;
import Global.*;
import Global.MoveState;

class Player extends Sprite {
  private static var YOFFSET = 16;
  private static var IMAGEPATH:String = "assets/Sprites/player.png";  // Image sprite
  private var bitmap:Bitmap;  // Player bitmap
  private var walkState:MoveState = STOP;  // Stopped or moving in a direction

  public function updateMovement() {  // Player walking
    var inputs = Input.inputs;
    var last = Input.lastInputs[0];  // Last input takes precedence

    // Only take in inputs if the player is currently stopped
    if(this.walkState == STOP) {
      if(inputs[KeyIndexes.UP] && last == UP) this.walkState = UP;
      else if(inputs[KeyIndexes.DOWN] && last == DOWN) this.walkState = DOWN;
      else if(inputs[KeyIndexes.LEFT] && last == LEFT) this.walkState = LEFT;
      else if(inputs[KeyIndexes.RIGHT] && last == RIGHT) this.walkState = RIGHT;
    }
    if(this.walkState != STOP) {
      // Update position during non-stopped walkstates
      switch(this.walkState) {
        case STOP:  // Needed for compilation
        case UP:
          GameState.y -= MOVESPEED;
        case DOWN:
          GameState.y += MOVESPEED;
        case LEFT:
          GameState.x -= MOVESPEED;
        case RIGHT:
          GameState.x += MOVESPEED;
      }

      // If an "integer" tile has been hit, stop
      if(GameState.x % TILESIZE == 0 && GameState.y % TILESIZE == 0) {
        this.walkState = STOP;
        // Update tile
        GameState.xt = Math.floor(GameState.x/TILESIZE);
        GameState.yt = Math.floor(GameState.y/TILESIZE);
      }
    }
  }

  public function update() {
    this.updateMovement();
  }

  // Put player in the middle of the screen using dimensions of stage object
  public function center() {
    this.bitmap.x = XCENTER;
    this.bitmap.y = YCENTER - Player.YOFFSET;
  }

  public function new(main:Sprite) {
    super();

    var bitmapData = Assets.getBitmapData(IMAGEPATH);
    this.bitmap = new Bitmap(bitmapData);
    this.center();  // Put sprite in center
    // Render bitmap with DisplayObjectContainer/Sprite object
    main.addChild(this.bitmap);
  }
}