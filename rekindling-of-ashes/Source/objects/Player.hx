// Class for player-related entities
package objects;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.Stage;
import openfl.Assets;
import worldMap.Collision.CollisionType;
import Global.*;
import Global.MoveState;

class Player {
  private static var YOFFSET = 16;
  private static var IMAGEPATH:String = "assets/Sprites/People/Player/";  // Image sprite
  private static var SPRITENAMES = ['U','D', 'L', 'R',  // Player{U/D/...}.png
                                    'LL', 'LR', 'RL', 'RR', 'UL', 'UR', 'DL', 'DR'];
  private static var SPRITEINDEXES = ['U'=> 0, 'D'=> 1, 'L'=> 2, 'R'=> 3,
                                      'LL'=> 4, 'LR'=> 5, 'RL'=> 6, 'RR'=> 7,
                                      'UL'=> 8, 'UR'=> 9, 'DL'=> 10, 'DR'=> 11];
  public static var MOVESPEED = 2;  // Movement speed, must divide TILESIZE
  private static var TOTALWALKFRAMES = Std.int(TILESIZE/MOVESPEED);
  private static var ANIMFRAMES = [4, 12];  // Range of "foot out" animation

  private var bitmaps:Array<Bitmap> = [];  // Player bitmaps
  private var walkState:MoveState = STOP;  // Stopped or moving in a direction
  private var walkFrames:Int = 0;  // Frame counter of walk animation
  private var rightFoot = true;  // Is the player walking with their right foot next?
  public var animState = 'D';  // Store current animation state

  // Depending on this.walkFrames, choose an animation
  private function selectWalkAnim() {
    // "Foot out" frame
    if(this.walkFrames == ANIMFRAMES[0]) {
      // Update the animation to stick a foot out
      this.changeAnim(this.animState + (this.rightFoot ? 'R' : 'L'));
      this.rightFoot = !this.rightFoot;  // Other foot next time
    }
    // "Foot back in" frame
    else if(this.walkFrames == ANIMFRAMES[1]) {
      this.changeAnim(this.animState.charAt(0));
    }
  }

  private function updateMovement() {  // Player walking
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
      this.selectWalkAnim();  // Select which animation to use

      // If TOTALWALKFRAMES has been hit, stop
      if(this.walkFrames == TOTALWALKFRAMES) {
        this.walkState = STOP;
        // Update tile coordinates
        GameState.xt = Math.floor(GameState.x/TILESIZE);
        GameState.yt = Math.floor(GameState.y/TILESIZE);

        // Check if standing on a warp tile
        if(collide(STOP) == WARP) {
          // Let the warp function do the work, using the player's position in GameState
          worldMap.Warps.warp();
        }

        // Reset walkFrames
        this.walkFrames = 0;
      }
    }
  }

  // Change to a different animation state
  public function changeAnim(state:String) {
    if(state == 'S') {  // 's' means don't change the state
      return;
    }
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

  // Add player to the display
  public function add(main:Sprite) {
    for(bitmap in this.bitmaps) {
      main.addChild(bitmap);
    }
  }

  // Remove player from the display
  public function remove(main:Sprite) {
    for(bitmap in this.bitmaps) {
      main.removeChild(bitmap);
    }
  }

  // Put player in the middle of the screen using dimensions of stage object
  public function center(bitmap:Bitmap) {
    bitmap.x = XCENTER;
    bitmap.y = YCENTER - Player.YOFFSET;
    bitmap.visible = false;  // Also, initially set invisible
  }

  public function new(main:Sprite) {
    // Iterate over all player Sprites, adding them to the display
    for(name in Player.SPRITENAMES) {
      var bitmapData = Assets.getBitmapData(IMAGEPATH + 'Player$name.png');
      var bitmap = new Bitmap(bitmapData);
      this.center(bitmap);  // Put sprite in center and disable it
      this.bitmaps.push(bitmap);  // Add the new bitmap
    }

    // Make initial animation state visible
    this.changeAnim(this.animState);
  }
}