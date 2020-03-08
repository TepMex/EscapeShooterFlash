package Items
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	public class WinWindow extends Sprite
	{
		
		public function WinWindow():void
		{
			
			super();
			
			this.x = Game.MESSAGE_BOX_COORDS.x;
			this.y = Game.MESSAGE_BOX_COORDS.y;
			
			restartButton.addEventListener(MouseEvent.CLICK, restartLevel, false, 0, true);
			
		}
		
		private function restartLevel(e:MouseEvent):void
		{
			
			Game.gameLink.setLevel(Game.gameLink.levelId);
			
		}
		
	}
	
	
}