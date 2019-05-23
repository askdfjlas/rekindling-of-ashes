package objects;

class Lists {
  // Store object data in arrays of triples
  private static var objectData:Array<Array<Array<Float>>> = [
    [],  // Test map
    [[0, 7, 5.3]]  // Bedroom
  ];
  // Array of ObjectLists
  public static var objectLists:Array<ObjectList> = [];

  public static function init() {
    for(tripleList in objectData) {
      objectLists.push(new ObjectList(tripleList));
    }
  }
}