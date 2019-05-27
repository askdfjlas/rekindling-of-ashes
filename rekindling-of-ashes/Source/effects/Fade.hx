// An fade effect used when loading new regions
package effects;

import openfl.display.Sprite;
import effects.EffectManager.AnimationTime;
import Global.*;

class Fade extends Sprite {
  // Number of frames in the fade animation
  private static var NUMFRAMES:Int = 20;
  // Loops from -NUMFRAMES to 0 for the fade out, then 0 to NUMFRAMES for fade in
  private var frameCount:Int = -NUMFRAMES;
  public var added:Bool = false;  // Keep track of whether the rect has been added yet

  // Play the animation, return the time
  public function play(main:Sprite):AnimationTime {
    if(!this.added) {
      main.addChild(this);
      this.added = true;
    }

    this.frameCount++;
    this.visible = true;
    if(this.frameCount == NUMFRAMES)  {  // Stop if NUMFRAMES is hit
      this.frameCount = -NUMFRAMES;  // Reset frameCount
      // Remove from view
      this.visible = false;
      main.removeChild(this);
      this.added = false;
      return DONE;
    }

    // Else update the alpha value
    this.alpha = 1 - Math.abs(this.frameCount/NUMFRAMES);
    // A frameCount of 0 means that the screen is dark and it is time to load
    return this.frameCount == 0 ? LOADTIME : ANIMATING;
  }

  public function new() {
    // Call parent constructor and create an invisible rectangle for later use
    super();
    this.graphics.beginFill(0x000000);
    this.graphics.drawRect(0, 0, STAGEWIDTH, STAGEHEIGHT);
    this.visible = false;
  }
}