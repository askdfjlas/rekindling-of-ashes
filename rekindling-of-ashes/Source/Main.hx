// Main class
package;

import openfl.display.Sprite;
import openfl.events.Event;
import Global.*;
import worldMap.*;
import objects.Player;
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
				GameState.vs.update(this);  // Update player
			case LOADING:
		}
	}

	function init() {
		stage.color = 0x000000;  // Black background
		stage.frameRate = FRAMERATE;  // FPS
		AssetLoader.init();  // Load assets
		Input.init(stage);  // Init input handling
		worldMap.Maps.init();  // Init TileMap objects
		objects.Lists.init();  // Init object lists
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
