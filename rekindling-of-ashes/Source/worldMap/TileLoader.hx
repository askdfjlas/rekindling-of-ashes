// Tile Loader, BitmapData objects are stored in a static array
package worldMap;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

class TileLoader {
  private static var NUMTILES:Int = 4;  // Total number of tiles to load
  private static var IMAGEPATH = "assets/Sprites/Tiles/";  // Path to tile pngs
  public static var tileData:Array<BitmapData> = [];  // Array of BitmapData objects

  public static function init() {
    // Iterate over 0...NUMTILES.png
    for(i in 0...NUMTILES) {
      var bitmapData = Assets.getBitmapData(IMAGEPATH + '$i.png');
      TileLoader.tileData.push(bitmapData);
    }
  }
}