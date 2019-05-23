package objects;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import Global.*;

class Object {
  // The type of the object is an integer x which corresponds to x.png
  public var type:Int;
  private var bitmap:Bitmap;

  // Objects are bounded to static coordinates
  public var staticX:Int;
  public var staticY:Int;

  // Check if the object is in view of the screen
  private function checkInBounds():Bool {
    // x coordinates of left and right sides of the screen
    var l = Std.int(GameState.x - STAGEWIDTH/2);
    var r = Std.int(GameState.x + STAGEWIDTH/2);
    // y coordinates of top and bottom of of the screen
    var u = Std.int(GameState.y - STAGEHEIGHT/2);
    var d = Std.int(GameState.y + STAGEHEIGHT/2);

    if(this.staticX + this.bitmap.width > l && this.staticX < r &&
      this.staticY + this.bitmap.height > u && this.staticY < d) {
        return true;
    }
    return false;
  }

  public function remove(main:Sprite) {
    main.removeChild(this.bitmap);
  }

  // Update the position of the object
  public function update(main:Sprite) {
    // Only update if the object is in bounds
    if(this.checkInBounds()) {
      main.addChild(this.bitmap);
      this.bitmap.x = this.staticX - GameState.x + XCENTER;
      this.bitmap.y = this.staticY - GameState.y + YCENTER;
    }
  }

  // Object(x) creates an object of type x
  public function new(num:Int, x:Float, y:Float) {
    // Set static location, convert tile coordinates to pixel coordinates
    this.staticX = Std.int(x*TILESIZE);
    this.staticY = Std.int(y*TILESIZE);

    this.type = num;  // Set the type of the tile
    var bitmapData = AssetLoader.objectData[this.type];  // Get BitmapData
    this.bitmap = new Bitmap(bitmapData);  // Create bitmap
  }
}