package objects;

import openfl.display.Sprite;

class ObjectList {
  public var objectArray:Array<Object> = [];

  // Render all objects
  public function render(main:Sprite) {
    // First remove all objects, to re-create the order
    this.removeAll(main);

    // Keep track of whether the player has been drawn yet
    var playerDrawn = false;
    for(object in this.objectArray) {
      /* Objects are sorted in increasing y order; this condition
      means that all further objects will be below the player, and therefore
      should be rendered afterwards */
      if(!playerDrawn && object.staticY > GameState.y) {
        GameState.vs.add(main);
        playerDrawn = true;
      }
      object.update(main);
    }
    // If there were no objects below the player, still draw him!
    if(!playerDrawn) GameState.vs.add(main);
  }

  // Remove all objects from the view
  public function removeAll(main:Sprite) {
    GameState.vs.remove(main);
    for(object in this.objectArray) {
      object.remove(main);
    }
  }

  public function new(numberArray:Array<Array<Float>>) {
    // Convert numeric array of triples to Object Array
    for(triple in numberArray) {
      var type = Std.int(triple[0]);  // Object type
      var x = triple[1];  // x in tiles
      var y = triple[2];  // y in tiles

      this.objectArray.push(new Object(type, x, y));
    }
  }
}