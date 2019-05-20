// Input handling class
package;

import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import Global.*;
import Global.MoveState;

class Input extends Sprite {
  // Store whether arrow keys are pressed
  public static var inputs = [false, false, false, false];
  // Direction of last 2 pressed arrow keys
  public static var lastInputs:Array<MoveState> = [STOP, STOP];

  // Callback function for whenever a key is pressed
  private static function keyDown(event:KeyboardEvent) {
    switch(event.keyCode) {
      case Keyboard.UP:  // Up Arrow
        if(!Input.inputs[KeyIndexes.UP]) {
          Input.inputs[KeyIndexes.UP] = true;
          Input.rightShiftInputs(UP);
        }
      case Keyboard.DOWN:  // Down Arrow
        if(!Input.inputs[KeyIndexes.DOWN]) {
          Input.inputs[KeyIndexes.DOWN] = true;
          Input.rightShiftInputs(DOWN);
        }
      case Keyboard.LEFT:  // Left Arrow
        if(!Input.inputs[KeyIndexes.LEFT]) {
          Input.inputs[KeyIndexes.LEFT] = true;
          Input.rightShiftInputs(LEFT);
        }
      case Keyboard.RIGHT:  // Right Arrow
        if(!Input.inputs[KeyIndexes.RIGHT]) {
          Input.inputs[KeyIndexes.RIGHT] = true;
          Input.rightShiftInputs(RIGHT);
        }
    }
  }

  // Callback function for whenever a key is released
  private static function keyUp(event:KeyboardEvent) {
    switch(event.keyCode) {
      case Keyboard.UP:  // Up Arrow
        Input.inputs[KeyIndexes.UP] = false;
        Input.leftShiftInputs(UP);
      case Keyboard.DOWN:  // Down Arrow
        Input.inputs[KeyIndexes.DOWN] = false;
        Input.leftShiftInputs(DOWN);
      case Keyboard.LEFT:  // Left Arrow
        Input.inputs[KeyIndexes.LEFT] = false;
        Input.leftShiftInputs(LEFT);
      case Keyboard.RIGHT:  // Right Arrow
        Input.inputs[KeyIndexes.RIGHT] = false;
        Input.leftShiftInputs(RIGHT);
    }
  }

  // Set a new last pressed key, a right shift
  private static function rightShiftInputs(direction:MoveState) {
    Input.lastInputs = [direction, Input.lastInputs[0]];
  }

  // "Pop" the last pressed key if it gets released
  private static function leftShiftInputs(direction:MoveState) {
    if(direction == Input.lastInputs[0]) {
      Input.lastInputs = [Input.lastInputs[1], STOP];
    }
  }

  // Setup callbacks
  public static function init(stage:Stage) {
    // Add listeners to main stage
    stage.addEventListener(KeyboardEvent.KEY_DOWN, Input.keyDown);
    stage.addEventListener(KeyboardEvent.KEY_UP, Input.keyUp);
  }
}