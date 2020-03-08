package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.display.StageScaleMode;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import Items.LoseWindow;
	import Items.WinWindow;
	import Levels.*;
	import Creatures.Character;
	import Items.GameCursor;
	
	public class Game extends Sprite
	{
		
		public static const ENDCODE_GAMEOVER:int = 1;
		public static const ENDCODE_YOUWIN:int = 2;
		
		public static const MESSAGE_BOX_COORDS:Point = new Point(175, 100);
		
		public static var pause:Boolean = false;
		
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
			
			stageLink.addEventListener(Event.ACTIVATE, onActivate, false, 0, true);
			stageLink.addEventListener(Event.DEACTIVATE, onDeactivate, false, 0, true);
			
			stageLink.addEventListener(Event.ENTER_FRAME, Update, false, 0, true); //must be called last
			
			
			
		}
		
		public function setLevel(id:int):void
		{
			if (currLevel != null)
			{
				currLevel.deleteLevel();
			}
			
			
			pause = false;
			var levelClass:Class = stageLink.loaderInfo.applicationDomain.getDefinition("Levels.Level_" + id) as Class;
			currLevel = new levelClass();
			currLevel.heroLink = new Character();
			this.levelId = id;
			
		}
		
		public function Update(e:Event):void
		{
			
			if (pause) { return; }
			
			currLevel.Update();
			
		}
		
		public static function endGame(endCode:int):void
		{
			
			switch(endCode)
			{
				
				case ENDCODE_GAMEOVER:
				{
					
					currLevel.heroLink.deleteCharacter();
					currLevel.addChild(new LoseWindow);
					break;
					
				}
				
				case ENDCODE_YOUWIN:
				{
					
					currLevel.heroLink.deleteCharacter();
					currLevel.addChild(new WinWindow);
					break;
					
				}
				
				
			}
			
			pause = true;
			
		}
		
		public function onDeactivate(e:Event):void
		{
			
			pause = true;
			
		}
		
		public function onActivate(e:Event):void
		{
			
			pause = false;
			
		}
		
		
	}
	
	
}