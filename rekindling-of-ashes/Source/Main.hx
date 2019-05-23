// Main class
package;

import openfl.display.Sprite;
import openfl.events.Event;
import worldMap.*;
import objects.Player;

class Main extends Sprite
{
	// Game loop
	function gameLoop(event:Event) {
		GameState.vs.update();
		GameState.tileMap.render();
		GameState.objectList.render(this);
	}

	function init() {
		stage.color = 0x000000;  // Black background
		AssetLoader.init();  // Load assets
		Input.init(stage);  // Init input handling
		worldMap.Maps.init();  // Init TileMap objects
		objects.Lists.init();  // Init object lists
		GameState.updateMap(this);  // Load specific map
		GameState.vs = new Player(this);  // Instantiate player

		this.addEventListener(Event.ENTER_FRAME, gameLoop);  // Init game loop
	}

	public function new() {
		super();
		this.init();
	}
}
