package Items
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	public class Interface extends Sprite
	{
		
		
		public function Interface():void
		{
			
			super();
			
			pauseButton.addEventListener(MouseEvent.CLICK, setPause, false, 0, true);
			
		}
		
		private function setPause(e:MouseEvent):void
		{
			
			Game.pause = !Game.pause;
			
		}
		
		
	}
	
	
	
}