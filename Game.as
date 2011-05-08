package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.display.StageScaleMode;
	import Levels.*;
	
	public class Game extends Sprite
	{
		
		public static const ENDCODE_GAMEOVER:int = 1;
		public static const ENDCODE_YOUWIN:int = 2;
		
		public static var stageLink:Stage;
		public static var gameLink:Game;
		
		public static var currLevel:Level;
		public var levelId:int;
		
		public var cursor:GameCursor;
		
		public function Game(_stage:Stage):void
		{
			
			super();
			
			stageLink = _stage;
			gameLink = this;
			stageLink.addChild(gameLink);
			
			var gameMask:Mask = new Mask();
			stageLink.addChild(gameMask);
			gameLink.mask = gameMask;
			
			
			stage.showDefaultContextMenu = false;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.tabChildren = false;
			stage.stageFocusRect = false;
			stage.focus = stage;
			stage.quality = "high";
			
			setLevel(1);
			
			cursor = new GameCursor();
			
			stageLink.addEventListener(Event.ENTER_FRAME, Update, false, 0, true); //must be called last
			
			
		}
		
		public function setLevel(id:int):void
		{
			
			var levelClass:Class = stageLink.loaderInfo.applicationDomain.getDefinition("Levels.Level_" + id) as Class;
			currLevel = new levelClass();
			currLevel.heroLink = new Character();
			
		}
		
		public function Update(e:Event):void
		{
			
			currLevel.Update();
			
		}
		
		public static function endGame(endCode:int):void
		{
			
			switch(endCode)
			{
				
				case ENDCODE_GAMEOVER:
				{
					
					trace("Game over");
					currLevel.heroLink.death();
					break;
					
				}
				
				case ENDCODE_YOUWIN:
				{
					
					trace("You safed");
					break;
					
				}
				
				
			}
			
		}
		
		
	}
	
	
}