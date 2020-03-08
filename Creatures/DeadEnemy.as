package Creatures
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class DeadEnemy extends MovieClip
	{
		
		
		public function DeadEnemy(whoDies:Enemy):void
		{
			
			super();
			
			this.x = whoDies.x;
			this.y = whoDies.y;
			
			Game.currLevel.addChild(this);
			
			var clearTimer:Timer = new Timer(1000, 1);
			
			clearTimer.addEventListener(TimerEvent.TIMER_COMPLETE, clearDeadEnemy, false, 0, true);
			
			clearTimer.start();
			
		}
		
		private function clearDeadEnemy(e:TimerEvent):void
		{
			
			this.removeEventListener(TimerEvent.TIMER_COMPLETE, clearDeadEnemy);
			parent.removeChild(this);
			
		}
		
	}
	
	
}