// Globals
package;

class Global {
  public static var KeyIndexes = {UP: 0, DOWN: 1, LEFT: 2, RIGHT: 3}; // Key indexes
  public static var TILESIZE:Int = 32;  // Tiles are 32x32 pixels

  // Stage width and height
  public static var STAGEWIDTH:Int = 960;
  public static var STAGEHEIGHT:Int = 600;

  // Coordinates for the center of the screen for a TILESIZE*TILESIZE tile
  public static var XCENTER:Int = Std.int((STAGEWIDTH - TILESIZE)/2);
  public static var YCENTER:Int = Std.int((STAGEHEIGHT - TILESIZE)/2);
}