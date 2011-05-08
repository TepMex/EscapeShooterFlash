package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	
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
			
			Game.stageLink.addChild(this);
			
			Game.stageLink.addEventListener(MouseEvent.MOUSE_MOVE, rotateByMouse, false, 0, true);
			Game.stageLink.addEventListener(MouseEvent.MOUSE_DOWN, shoot, false, 0, true);
			Game.stageLink.addEventListener(KeyboardEvent.KEY_DOWN, setKeyboardFlags, false, 0, true);
			Game.stageLink.addEventListener(KeyboardEvent.KEY_UP, resetKeyboardFlags, false, 0, true);
			
			this.addEventListener(Event.ENTER_FRAME, this.moveByKeyboard);
			
		}
		
		private function rotateByMouse(e:MouseEvent):void 
		{
			
			this.rotation = Math.atan2(e.stageY - this.y, e.stageX - this.x) * 180 / Math.PI;
			
		}
		
		private function shoot(e:MouseEvent):void
		{
			
			if (Bullet.allBullets.length >= 3) { return; }
			
			var gunPoint:Point = new Point(this.gun.x, this.gun.y);
			gunPoint = this.localToGlobal(gunPoint);
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
			
		private function moveByKeyboard(e:Event):void 
		{
			
			if (this.keyboardFlags.W)
			{
				this.y -= this.speed;
			}
				
			if (this.keyboardFlags.A)
			{
				this.x -= this.speed;
			}
				
			if (this.keyboardFlags.S)
			{
				this.y += this.speed;
			}
				
			if (this.keyboardFlags.D)
			{
				this.x += this.speed;
			}
			
		}
		
		public function death():void
		{
			
			parent.removeChild(this);
			Game.currLevel.pause = true;
			delete this;
			
		}
		
	}
	
	
	
}