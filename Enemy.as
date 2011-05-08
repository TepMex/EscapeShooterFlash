package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	public class Enemy extends Sprite
	{
		
		public static var allEnemies:Array = new Array();
		public static var enemyCounter:int;
		private const speed:Number = 1.3;
		
		private var dx:Number;
		private var dy:Number;
		
		public function Enemy():void
		{
			
			super();
			
			enemyCounter++;
			
			allEnemies.push(this);
			
			this.addEventListener(Event.ENTER_FRAME, runForHero, false, 0, true);
			
		}
		
		public function death():void
		{
			
			allEnemies.splice(allEnemies.indexOf(this), 1);
			parent.removeChild(this);
			delete this;
			
		}
		
		private function runForHero(e:Event):void
		{
			
			var xdistance:Number;
			var ydistance:Number;
			var distance:Number;
			
			xdistance = Game.currLevel.heroLink.x - this.x; //Math.abs not use, because dx and dy
			ydistance = Game.currLevel.heroLink.y - this.y; //may be negative
			distance = Math.sqrt(Math.pow(xdistance, 2) + Math.pow(ydistance, 2));
			
			this.dx = (speed * xdistance) / distance;
			this.dy = (speed * ydistance) / distance;
			
			if (hitsEnemy())
			{
				this.dx = - this.dx;
				this.dy = - this.dy;
			}
			
			this.x += this.dx;
			this.y += this.dy;
			
		}
		
		private function hitsEnemy():Boolean
		{
			
			for (var i:int = 0; i < Enemy.allEnemies.length; i++)
			{
				
				if (this.hitTestObject(Enemy.allEnemies[i]))
				{
					if (i != Enemy.allEnemies.indexOf(this))
					{
						return true;
					}
					
					continue;
					
				}
				
			}
			
			return false;
			
		}
		
	}
	
	
}