package ru.mihawww.shooter{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.Stage;
	
	
	internal class GameCursor extends MovieClip {
		
		
		public function GameCursor(owner:ShooterUniverse) {
			super();

			this.x = mouseX;
			this.y = mouseY;
			
			owner.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.moveAsCursor);
			trace(2);
		}
		
		internal function moveAsCursor(e:MouseEvent):void{
			this.x = e.stageX;
			this.y = e.stageY;
		}
	}
	
}
