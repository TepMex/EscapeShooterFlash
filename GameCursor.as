package  
{
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.Stage;
	import flash.ui.Mouse;
	
	
	public class GameCursor extends Sprite
	{
		
		
		public function GameCursor():void 
		{
			
			super();
			
			this.x = mouseX;
			this.y = mouseY;
			
			Mouse.hide();
			
			Game.stageLink.addChild(this);
			
			Game.stageLink.addEventListener(MouseEvent.MOUSE_MOVE, moveAsCursor, false, 0, true);
			
		}
		
		private function moveAsCursor(e:MouseEvent):void
		{
			
			this.x = e.stageX;
			this.y = e.stageY;
			
		}
		
		
	}
	
}
