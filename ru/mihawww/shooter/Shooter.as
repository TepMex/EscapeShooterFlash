package ru.mihawww.shooter{
	
	public class ShooterUniverse{
		
		import flash.utils.Timer;
		import flash.events.TimerEvent;
		import flash.events.Event;
			
		public var hero:Character = new Character(stage);
		
		public function ShooterUniverse(){
			
			Mouse.hide();
			var gameCursor:GameCursor = new GameCursor(stage);
			addChild(gameCursor);
			
		    var enemyTimer:Timer = new Timer(1000,5);
		    enemyTimer.addEventListener(TimerEvent.TIMER, this.generateEnemy);
		    enemyTimer.start();
			
		}

			
		function generateEnemy(e:TimerEvent):void {
			var enemy:Enemy = new Enemy(stage);
			addChild(enemy);
		}
	}
}

