// Main class
package;

import openfl.display.Sprite;
import openfl.events.Event;
import Global.*;
import worldMap.*;
import objects.Player;
import effects.EffectManager.AnimationTime;
import GameState.State;
import openfl.display.FPS;

class Main extends Sprite
{
	// Game loop
	function gameLoop(event:Event) {
		switch(GameState.state) {
			case PLAYING:
				GameState.tileMap.render();  // Render tilemap
				GameState.objectList.render(this);  // Render objects
				GameState.vs.update();  // Update player
			case LOADING:
				var fade = effects.EffectManager.fade;
				/* Play the fade animation; do different things depending on how
				much time has elapsed */
				switch(fade.play(this)) {
					case ANIMATING:  // Do nothing
					case LOADTIME:
						this.removeChildren();  // Clear screen
						GameState.updateMap(this);  // Update the map while the screen is dark
						// Do one frame of rendering to put objects/tiles in their places
						GameState.tileMap.render();  // Render tilemap
						GameState.objectList.render(this);  // Render objects
						this.addChild(fade);  // Re-add the fade object
					case DONE:  // No longer loading
						GameState.state = PLAYING;
				}
		}
	}

	function init() {
		stage.color = 0x000000;  // Black background
		stage.frameRate = FRAMERATE;  // FPS
		AssetLoader.init();  // Load assets
		Input.init(stage);  // Init input handling
		worldMap.Maps.init();  // Init TileMap objects
		objects.Lists.init();  // Init object lists
		effects.EffectManager.init();  // Init effects
		GameState.updateMap(this);  // Load specific map
		GameState.vs = new Player(this);  // Instantiate player

		if(SHOWFRAMERATE) {  // Show an FPS counter
			var fps = new FPS(10, 10, 0xFF0000);
			this.addChild(fps);
		}

		this.addEventListener(Event.ENTER_FRAME, gameLoop);  // Init game loop
		GameState.state = PLAYING;  // Everything's loaded, state is now playing
	}

	public function new() {
		super();
		this.init();
	}
}
