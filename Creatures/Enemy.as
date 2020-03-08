package Creatures
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	public class Enemy extends Sprite
	{
		
		public static var allEnemies:Array = new Array();
		public static var enemyCounter:int;
		private const speed:Number = 2;
		
		private var armor:int = 5;
		
		private var dx:Number;
		private var dy:Number;
		
		public function Enemy():void
		{
			
			super();
			
			enemyCounter++;
			
			allEnemies.push(this);
			
		}
		
		public function getDamage():void
		{
			armor--;
			if (!armor)
			{
				var d:DeadEnemy  = new DeadEnemy(this);
				allEnemies.splice(allEnemies.indexOf(this), 1);
				parent.removeChild(this);
				delete this;
			}
			
		}
		
		public function Update():void
		{
			
			if (hitsObstacles())
			{
				this.x -= this.dx;
				this.y -= this.dy;
				return;
			}
			
			var xdistance:Number;
			var ydistance:Number;
			var distance:Number;
			
			xdistance = Game.currLevel.heroLink.x - this.x; //Math.abs not use, because dx and dy
			ydistance = Game.currLevel.heroLink.y - this.y; //may be negative
			distance = Math.sqrt(Math.pow(xdistance, 2) + Math.pow(ydistance, 2));
			
			this.dx = (speed * xdistance) / distance;
			this.dy = (speed * ydistance) / distance;
			
			
			this.x += this.dx;
			this.y += this.dy;
			
		}
		
		private function hitsObstacles():Boolean
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