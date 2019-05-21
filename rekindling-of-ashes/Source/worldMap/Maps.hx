// Store all map data as constants in this class
package worldMap;

class Maps {
  // All map data in raw form: stored as an array of 2D arrays
  private static var mapData:Array<Array<Array<Int>>> = [
    [[0, 2, 2, 2, 1, 2, 1],  // First test map
    [1, 0, 2, 3, 1, 2, 1],
    [1, 0, 0, 2, 1, 2, 1],
    [3, 1, 2, 3, 2, 1, 1]],

    [[0, 7, 7, 7, 7, 7, 7, 7, 7],
    [0, 8, 8, 8, 8, 8, 8, 8, 8],
    [4, 5, 5, 5, 5, 5, 5, 5, 5],  // Bedroom
    [4, 5, 5, 5, 5, 5, 5, 5, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5]]
  ];

  // All TileMap objects stored in an array
  public static var tileMaps:Array<TileMap> = [];

  // Generate TileMaps from mapData
  public static function init() {
    for(arr in mapData) {
      tileMaps.push(new TileMap(arr));
    }
  }
}