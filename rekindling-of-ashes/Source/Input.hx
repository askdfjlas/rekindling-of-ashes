// Input handling class
package;

import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import Global.*;

class Input extends Sprite {
  // Store whether arrow keys are pressed
  public static var inputs = [false, false, false, false];

  // Callback function for whenever a key is pressed
  private static function keyDown(event:KeyboardEvent) {
    switch(event.keyCode) {
      case Keyboard.UP:  // Up Arrow
        Input.inputs[KeyIndexes.UP] = true;
      case Keyboard.DOWN:  // Down Arrow
        Input.inputs[KeyIndexes.DOWN] = true;
      case Keyboard.LEFT:  // Left Arrow
        Input.inputs[KeyIndexes.LEFT] = true;
      case Keyboard.RIGHT:  // Right arrow
        Input.inputs[KeyIndexes.RIGHT] = true;
    }
  }

  // Callback function for whenever a key is released
  private static function keyUp(event:KeyboardEvent) {
    switch(event.keyCode) {
      case Keyboard.UP:  // Up Arrow
        Input.inputs[KeyIndexes.UP] = false;
      case Keyboard.DOWN:  // Down Arrow
        Input.inputs[KeyIndexes.DOWN] = false;
      case Keyboard.LEFT:  // Left Arrow
        Input.inputs[KeyIndexes.LEFT] = false;
      case Keyboard.RIGHT:  // Right Arrow
        Input.inputs[KeyIndexes.RIGHT] = false;
    }
  }

  // Setup callbacks
  public static function init(stage:Stage) {
    // Add listeners to main stage
    stage.addEventListener(KeyboardEvent.KEY_DOWN, Input.keyDown);
    stage.addEventListener(KeyboardEvent.KEY_UP, Input.keyUp);
  }
}