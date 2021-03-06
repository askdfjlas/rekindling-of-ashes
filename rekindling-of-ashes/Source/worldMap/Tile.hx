// Class for single tile
package worldMap;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import Global.*;

class Tile {
  // The type of the tile is an integer x which corresponds to x.png
  public var type:Int;
  private var bitmap:Bitmap;

  // Place the bitmap on the screen
  public function init(main:Sprite) {
    // Initially store tiles out of view
    this.bitmap.x = -10*TILESIZE;
    this.bitmap.y = -10*TILESIZE;
    main.addChild(this.bitmap);
  }

  // Update the position of the tile
  public function update(a:Int, b:Int) {
    this.bitmap.x = a;
    this.bitmap.y = b;
  }

  // Tile(x) creates a tile of type x
  public function new(num:Int) {
    this.type = num;  // Set the type of the tile
    var bitmapData = AssetLoader.tileData[this.type];  // Get BitmapData
    this.bitmap = new Bitmap(bitmapData);  // Create bitmap
  }
}