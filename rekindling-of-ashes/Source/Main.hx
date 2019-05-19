// Main class
package;

import openfl.display.Sprite;
import openfl.events.Event;
import worldMap.*;

class Main extends Sprite
{
	// Game loop
	function gameLoop(event:Event) {
		GameState.vs.update();  // Update player
		GameState.tileMap.render();
	}

	function init() {
		stage.color = 0x000000;  // Black background
		worldMap.TileLoader.init();  // Load tile bitmaps
		Input.init(stage);  // Init input handling
		worldMap.Maps.init();  // Init TileMap objects
		GameState.updateMap(this);  // Load specific map
		GameState.vs = new Player(this);  // Instantiate player

		this.addEventListener(Event.ENTER_FRAME, gameLoop);  // Init game loop
	}

	public function new() {
		super();
		this.init();
	}
}
