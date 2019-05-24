package objects;

class Lists {
  // Store object data in arrays of triples
  private static var objectData:Array<Array<Array<Float>>> = [
    [],  // Test map
    [[1, 7, 0.5], [2, 1, 1.7], [3, 1.3, 1.4], [0, 6.6, 5.32]]  // Bedroom
  ];
  // Array of ObjectLists
  public static var objectLists:Array<ObjectList> = [];

  public static function init() {
    for(tripleList in objectData) {
      objectLists.push(new ObjectList(tripleList));
    }
  }
}