package Levels
{
	import flash.geom.Point;
	
	
	public class Level_1 extends Level
	{
		
		public function Level_1():void
		{
			
			super();
			
			this.entryPoint = new Point(315, 210);
			
			this.x = 0;
			this.y = 0;
			
			Game.stageLink.addChild(this);
			
		}
		
		public override function Update():void
		{
			
			if (pause) { return; }
			
			var i:int;
			
			for (i = 0; i < Enemy.allEnemies.length; i++)
			{
				
				if (this.heroLink.hitTestObject(Enemy.allEnemies[i]))
				{
					
					Game.endGame(Game.ENDCODE_GAMEOVER);
					
				}
				
			}
			
		}
		
		
	}
	
	
}