package ru.mihawww.shooter{
	
	import flash.display.MovieClip;
	
	public class ShooterUniverse extends MovieClip{
		
		import flash.utils.Timer;
		import flash.events.TimerEvent;
		import flash.events.Event;
		import flash.ui.Mouse;
			
		public var hero:Character = new Character();
		
		public function ShooterUniverse(){
			
			super();
			
			//Mouse.hide();
			
			var gameCursor:GameCursor = new GameCursor(this);

			this.addChild(gameCursor);
			
		    //var enemyTimer:Timer = new Timer(1000,5);
		   // enemyTimer.addEventListener(TimerEvent.TIMER, this.generateEnemy);
		    //enemyTimer.start();
			
		}

			
		internal function generateEnemy(e:TimerEvent):void {
			//var enemy:Enemy = new Enemy();
			//addChild(enemy);
		}
	}
}

