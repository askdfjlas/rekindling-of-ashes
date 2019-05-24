// Tile Loader, BitmapData objects are stored in a static array
package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

class AssetLoader {
  private static var NUMTILES:Int = 10;  // Total number of tiles to load
  private static var IMAGEPATH = "assets/Sprites/Tiles/";  // Path to tile pngs
  public static var tileData:Array<BitmapData> = [];  // Array of BitmapData objects

  // Similarly, but for world "objects"
  private static var NUMOBJECTS:Int = 4;
  private static var OBJECTPATH = "assets/Sprites/Objects/";
  public static var objectData:Array<BitmapData> = [];

  // Load an array with its respective bitmap data
  private static function get(num:Int, path:String, arr:Array<BitmapData>) {
    // Iterate over 0...NUM.png
    for(i in 0...num) {
      var bitmapData = Assets.getBitmapData(path + '$i.png');
      arr.push(bitmapData);
    }
  }

  public static function init() {
    // Get tile and object bitmaps
    AssetLoader.get(NUMTILES, IMAGEPATH, tileData);
    AssetLoader.get(NUMOBJECTS, OBJECTPATH, objectData);
  }
}