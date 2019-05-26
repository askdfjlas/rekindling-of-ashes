// Store all map data as constants in this class
package worldMap;

class Maps {
  // All map data in raw form: stored as an array of 2D arrays
  private static var mapData:Array<Array<Array<Int>>> = [
    [[0, 2, 2, 2, 1, 2, 1],  // First test map
    [1, 0, 2, 3, 1, 2, 1],
    [1, 0, 0, 2, 1, 2, 1],
    [3, 1, 2, 3, 2, 1, 1]],

    [[0, 7, 7, 7, 7, 7, 7, 7, 7],  // Bedroom
    [0, 8, 8, 8, 8, 8, 8, 8, 8],
    [4, 5, 5, 5, 5, 5, 5, 9, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5]],

    [[0, 7, 7, 7, 7, 7, 7, 7, 7],  // Living room
    [0, 8, 8, 8, 8, 8, 8, 8, 8],
    [4, 5, 5, 5, 5, 5, 5, 5, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5],
    [4, 5, 5, 5, 5, 5, 5, 5, 5]]
  ];

  // Same with collision maps
  private static var collisionMapData:Array<Array<Array<Int>>> = [
    [[0, 0, 0, 0, 0, 0, 0],  // First test map
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]],

    [[1, 1, 1, 1, 1, 1, 1, 1, 1],  // Bedroom
    [1, 1, 1, 1, 1, 1, 1, 2, 1],
    [1, 1, 1, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 1, 1]],

    [[1, 1, 1, 1, 1, 1, 1, 1, 1],  // Living room
    [1, 0, 0, 0, 0, 0, 0, 0, 2],
    [1, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0]]
  ];

  // All TileMap and CollisionMap objects are stored in arrays
  public static var tileMaps:Array<TileMap> = [];
  public static var collisionMaps:Array<CollisionMap> = [];

  // Generate TileMaps from mapData
  public static function init() {
    // Push TileMaps
    for(arr in mapData) {
      tileMaps.push(new TileMap(arr));
    }

    // Push CollisionMaps
    for(arr in collisionMapData) {
      collisionMaps.push(new CollisionMap(arr));
    }
  }
}