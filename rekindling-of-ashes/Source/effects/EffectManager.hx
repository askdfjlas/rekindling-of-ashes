// Reference all visual effects in this class
package effects;

import openfl.display.Sprite;

// Send signals depending on how far the animation is
enum AnimationTime {
  ANIMATING;
  LOADTIME;
  DONE;
}

class EffectManager {
  public static var fade:Fade;  // Fade effect

  // Create an instance of every used effect
  public static function init() {
    EffectManager.fade = new Fade();
  }
}