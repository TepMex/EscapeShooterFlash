package Creatures
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import Items.Bullet;
	
	
	public class Character extends MovieClip
	{
		
		private  var keyboardFlags:Object = { W:false, A:false, S:false, D:false };
		private var speed:Number = 1.5;
		private var shootSound:Firesound;
		
		public function Character():void
		{
			
			super();
			
			this.x = Game.currLevel.entryPoint.x;
			this.y = Game.currLevel.entryPoint.y;
			
			this.shootSound = new Firesound();
			
			Game.currLevel.addChild(this);
			
			Game.stageLink.addEventListener(MouseEvent.MOUSE_MOVE, rotateByMouse, false, 0, true);
			Game.stageLink.addEventListener(MouseEvent.MOUSE_DOWN, shoot, false, 0, true);
			Game.stageLink.addEventListener(KeyboardEvent.KEY_DOWN, setKeyboardFlags, false, 0, true);
			Game.stageLink.addEventListener(KeyboardEvent.KEY_UP, resetKeyboardFlags, false, 0, true);
			
			Game.stageLink.focus = this;
			
		}
		
		private function rotateByMouse(e:MouseEvent):void 
		{
			
			var mouseLoc:Point = new Point(e.stageX, e.stageY);
			mouseLoc = Game.currLevel.globalToLocal(mouseLoc);
			this.rotation = Math.atan2(mouseLoc.y - this.y, mouseLoc.x - this.x) * 180 / Math.PI;
			
		}
		
		private function shoot(e:MouseEvent):void
		{
			
			if (Game.pause) { return; }
			
			if (Bullet.allBullets.length >= Bullet.MAX_BULLETS_ON_SCREEN) { return; }
			
			var gunPoint:Point = new Point(this.gun.x, this.gun.y);
			gunPoint = parent.globalToLocal(this.localToGlobal(gunPoint));
			var b:Bullet = new Bullet(gunPoint, this.rotation);
			
			shootSound.play();
			
		}
		
		private function setKeyboardFlags(e:KeyboardEvent):void 
		{
            
			var key:String = String.fromCharCode(e.charCode);
			
			switch(key)
			{
				
				case 'w':
				{ this.keyboardFlags.W = true; break; }
				
				case 'a':
				{ this.keyboardFlags.A = true; break; }
				
				case 's':
				{ this.keyboardFlags.S = true; break; }
				
				case 'd':
				{ this.keyboardFlags.D = true; break; }
				
			}
		}
			
		private function resetKeyboardFlags(e:KeyboardEvent):void 
		{
			
			var key:String = String.fromCharCode(e.charCode);
			
			switch(key)
			{
				
				case 'w':
				{ this.keyboardFlags.W = false; break; }
				
				case 'a':
				{ this.keyboardFlags.A = false; break; }
				
				case 's':
				{ this.keyboardFlags.S = false; break; }
				
				case 'd':
				{ this.keyboardFlags.D = false; break; }
				
			}
			
		}
			
		public function Update():void 
		{
			
			//magic numbers must be fix
			if (this.keyboardFlags.W && this.y > 16)
			{
				this.y -= this.speed;
			}
				
			if (this.keyboardFlags.A && this.x > 16)
			{
				this.x -= this.speed;
			}
				
			if (this.keyboardFlags.S && this.y < 374)
			{
				this.y += this.speed;
			}
				
			if (this.keyboardFlags.D && this.x < 614)
			{
				this.x += this.speed;
			}
			
		}
		
		public function deleteCharacter():void
		{
			
			Game.stageLink.removeEventListener(MouseEvent.MOUSE_MOVE, rotateByMouse);
			Game.stageLink.removeEventListener(MouseEvent.MOUSE_DOWN, shoot);
			Game.stageLink.removeEventListener(KeyboardEvent.KEY_DOWN, setKeyboardFlags);
			Game.stageLink.removeEventListener(KeyboardEvent.KEY_UP, resetKeyboardFlags);
			
			try
			{
				Game.currLevel.removeChild(this);
			}
			catch(e:TypeError)
			{
				trace(e.errorID);
			}
			catch (e:ArgumentError)
			{
				trace(e.errorID);
			}
			delete this;
			
		}
		
	}
	
	
	
}