package
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.events.Event;
	
	
	public class Bullet extends Sprite
	{
		
		public static var allBullets:Array = new Array();
		
		public const speed:Number = 7;
		
		public var dx:Number;
		public var dy:Number;
		
		public function Bullet(gunPoint:Point, gunAngle:Number):void
		{
			
			super();
			
			gunAngle = gunAngle * (Math.PI / 180); //back to radians... again(((
			
			this.x = gunPoint.x;
			this.y = gunPoint.y;
			
			this.dx = this.speed*Math.cos(gunAngle);
			this.dy = this.speed * Math.sin(gunAngle);
			
			this.addEventListener(Event.ENTER_FRAME, flyBullet, false, 0, true);
			
			allBullets.push(this);
			
			Game.stageLink.addChild(this);
			
		}
		
		public function flyBullet(e:Event):void {
			
			var j:int;
			
			for (j = 0; j < Enemy.allEnemies.length; j++)
				{
					
					if (this.hitTestObject(Enemy.allEnemies[j]))
					{
						
						Enemy.allEnemies[j].death();
						this.deleteBullet();
						return;
						
					}
					
				}
			
			this.x += this.dx; 
			this.y += this.dy;
			
			if (this.x > Game.stageLink.stageWidth || this.x < 0 || this.y > Game.stageLink.stageHeight || this.y < 0)
			{
				
				deleteBullet();
				
			}
			
		}
		
		public function deleteBullet():void
		{
			
			parent.removeChild(this);
			this.removeEventListener(Event.ENTER_FRAME, flyBullet);
			allBullets.splice(allBullets.indexOf(this),1);
			delete this;
			
		}
		
		
	}
	
	
}