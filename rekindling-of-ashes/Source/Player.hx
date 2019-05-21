// Class for player-related entities
package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.Stage;
import openfl.Assets;
import worldMap.Collision.CollisionType;
import Global.*;
import Global.MoveState;

class Player extends Sprite {
  private static var YOFFSET = 16;
  private static var IMAGEPATH:String = "assets/Sprites/People/Player/";  // Image sprite
  private static var SPRITENAMES = ['U','D', 'L', 'R'];  // Player{U/D/...}.png
  private static var SPRITEINDEXES = ['U'=> 0, 'D'=> 1, 'L'=> 2, 'R'=> 3];
  private static var TOTALWALKFRAMES = Std.int(TILESIZE/MOVESPEED);

  private var bitmaps:Array<Bitmap> = [];  // Player bitmaps
  private var walkState:MoveState = STOP;  // Stopped or moving in a direction
  private var walkFrames:Int = 0;  // Frame counter of walk animation
  private var animState = 'D';  // Store current animation state

  public function updateMovement() {  // Player walking
    var inputs = Input.inputs;
    var last = Input.lastInputs[0];  // Last input takes precedence

    // Collision detection function shorthand
    var collide = worldMap.Collision.collide;
    // Only take in inputs if the player is currently stopped
    if(this.walkState == STOP) {
      if(inputs[KeyIndexes.UP] && last == UP) {
        this.walkState = (collide(UP) != WALL) ? UP : STUCK;
        this.changeAnim('U');
      }
      else if(inputs[KeyIndexes.DOWN] && last == DOWN) {
        this.walkState = (collide(DOWN) != WALL) ? DOWN : STUCK;
        this.changeAnim('D');
      }
      else if(inputs[KeyIndexes.LEFT] && last == LEFT) {
        this.walkState = (collide(LEFT) != WALL) ? LEFT : STUCK;
        this.changeAnim('L');
      }
      else if(inputs[KeyIndexes.RIGHT] && last == RIGHT) {
        this.walkState = (collide(RIGHT) != WALL) ? RIGHT : STUCK;
        this.changeAnim('R');
      }
    }

    if(this.walkState != STOP) {
      // Update position during non-stopped walkstates
      switch(this.walkState) {
        case STOP:  // Needed for compilation
        case STUCK:
        case UP:
          GameState.y -= MOVESPEED;
        case DOWN:
          GameState.y += MOVESPEED;
        case LEFT:
          GameState.x -= MOVESPEED;
        case RIGHT:
          GameState.x += MOVESPEED;
      }
      this.walkFrames++;  // Increment walk frame

      // If TOTALWALKFRAMES has been hit, stop
      if(this.walkFrames == TOTALWALKFRAMES) {
        this.walkState = STOP;
        // Update tile coordinates
        GameState.xt = Math.floor(GameState.x/TILESIZE);
        GameState.yt = Math.floor(GameState.y/TILESIZE);
        // Reset walkFrames
        this.walkFrames = 0;
      }
    }
  }

  // Change to a different animation state
  private function changeAnim(state:String) {
    // Set the old animation state to invisible;
    var animIndex = Player.SPRITEINDEXES[this.animState];
    this.bitmaps[animIndex].visible = false;
    // Make the new animation state visible
    animIndex = Player.SPRITEINDEXES[state];
    this.bitmaps[animIndex].visible = true;
    // Update the animation state
    this.animState = state;
  }

  // Main update function
  public function update() {
    this.updateMovement();
  }

  // Put player in the middle of the screen using dimensions of stage object
  public function center(bitmap:Bitmap) {
    bitmap.x = XCENTER;
    bitmap.y = YCENTER - Player.YOFFSET;
    bitmap.visible = false;  // Also, initially set invisible
  }

  public function new(main:Sprite) {
    super();

    // Iterate over all player Sprites, adding them to the display
    for(name in Player.SPRITENAMES) {
      var bitmapData = Assets.getBitmapData(IMAGEPATH + 'Player$name.png');
      var bitmap = new Bitmap(bitmapData);
      this.center(bitmap);  // Put sprite in center and disable it
      this.bitmaps.push(bitmap);  // Add the new bitmap

      // Render bitmap with DisplayObjectContainer/Sprite object
      main.addChild(bitmap);
    }

    // Make initial animation state visible
    this.changeAnim(this.animState);
  }
}