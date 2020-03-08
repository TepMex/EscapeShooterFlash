package Levels
{
	import flash.geom.Point;
	import Creatures.*;
	import Items.*;
	
	public class Level_1 extends Level
	{
		
		private const offset:int = 30;
		
		public function Level_1():void
		{
			
			super();
			
			this.entryPoint = new Point(315, 210);
			this.exitPoint = new Point(this.target.x, this.target.y + offset); //must be fixed
			
			this.x = 0;
			this.y = offset;
			
			Game.stageLink.addChild(this);
			
			
		}
		
		public override function Update():void
		{
			
			if (this.heroLink.hitTestPoint(this.exitPoint.x, this.exitPoint.y, true)) { Game.endGame(Game.ENDCODE_YOUWIN); }
			
			var i:int;
			
			for (i = 0; i < Enemy.allEnemies.length; i++)
			{
				
				if (this.heroLink.hitTestObject(Enemy.allEnemies[i]))
				{
					
					Game.endGame(Game.ENDCODE_GAMEOVER);
					
				}
				
				Enemy.allEnemies[i].Update();
				
			}
			
			for (i = 0; i < Bullet.allBullets.length; i++)
			{
				
				Bullet.allBullets[i].Update();
				
			}
			
			this.heroLink.Update();
			
		}
		
		
	}
	
	
}