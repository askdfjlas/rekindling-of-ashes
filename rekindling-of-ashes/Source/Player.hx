// Class for player-related entities
package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.Stage;
import openfl.Assets;
import Global.*;

class Player extends Sprite {
  private static var SPEED:Int = 8;  // Movement speed
  private static var IMAGEPATH:String = "assets/Sprites/player.png";  // Image sprite
  private var bitmap:Bitmap;  // Player bitmap

  public function updateMovement() {  // Player walking
    var inputs = Input.inputs;

    if(inputs[KeyIndexes.UP]) GameState.y -= SPEED;
    if(inputs[KeyIndexes.DOWN]) GameState.y += SPEED;
    if(inputs[KeyIndexes.RIGHT]) GameState.x += SPEED;
    if(inputs[KeyIndexes.LEFT]) GameState.x -= SPEED;

    // Temporary as steps aren't quantized yet
    GameState.xt = Math.floor(GameState.x/TILESIZE);
    GameState.yt = Math.floor(GameState.y/TILESIZE);
  }

  public function update() {
    this.updateMovement();
  }

  // Put player in the middle of the screen using dimensions of stage object
  public function center(stage:Stage) {
    this.bitmap.x = (stage.stageWidth - bitmap.width)/2;
    this.bitmap.y = (stage.stageHeight - bitmap.height)/2;
  }

  public function new(main:Sprite, stage:Stage) {
    super();

    var bitmapData = Assets.getBitmapData(IMAGEPATH);
    this.bitmap = new Bitmap(bitmapData);
    this.center(stage);  // Put sprite in center
    // Render bitmap with DisplayObjectContainer/Sprite object
    main.addChild(this.bitmap);
  }
}