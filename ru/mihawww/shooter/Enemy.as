package  ru.mihawww.shooter{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	internal class Enemy extends MovieClip {
		
		var recDamage:int = 0;
		
		public static var enemyCounter:int = 0;
		
		public function Enemy() {

			this.x = parent.stage.stageWidth;
			this.y = Math.round(Math.random()*parent.stage.stageHeight);
			
			enemyCounter++;
			this.name = "enemy"+enemyCounter;
			
			trace(this.name);
			
			this.addEventListener(Event.ENTER_FRAME, this.moveAsEnemy);
			
		}
		
		function moveAsEnemy(e:Event):void {
			
			this.x--;
			
		}
		
	}
	
}
