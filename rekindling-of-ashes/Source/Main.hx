// Main class
package;

import openfl.display.Sprite;
import openfl.events.Event;
import worldMap.*;

class Main extends Sprite
{
	private var player:Player;

	// Game loop
	function gameLoop(event:Event):Void {
		player.update();  // Update player
		GameState.tileMap.render(stage);
	}

	function init() {
		stage.color = 0x000000;  // Black background
		worldMap.TileLoader.init();  // Load tile bitmaps
		Input.init(stage);  // Init input handling
		player = new Player(this, stage);  // Instantiate player
		this.addEventListener(Event.ENTER_FRAME, gameLoop);  // Init game loop

		worldMap.Maps.init();  // Init TileMap objects
		GameState.updateMap(this);
	}

	public function new()
	{
		super();
		this.init();
	}
}
