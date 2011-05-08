package  ru.mihawww.shooter{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.geom.Point;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	
	
	internal class Character extends MovieClip {
		
		internal var keyboardFlags:Object = {W:false, A:false, S:false, D:false};
		internal var speed:int = 3;
		internal var noise:Firesound = new Firesound();
		
		public function Character() {
			
			super();
			
			trace(4);
			this.x = 0;
			this.y = this.height/2;
			
			addEventListener(MouseEvent.MOUSE_MOVE, this.rotateByMouse);
			addEventListener(MouseEvent.MOUSE_DOWN, this.shoot);
			addEventListener(KeyboardEvent.KEY_DOWN, this.setKeyboardFlags);
			addEventListener(KeyboardEvent.KEY_UP, this.resetKeyboardFlags);
			
			this.addEventListener(Event.ENTER_FRAME, this.moveByKeyboard);
			
			addChild(this);
			
		}
		
		internal function rotateByMouse(e:MouseEvent):void {
			
			this.rotation = Math.atan2(e.stageY - this.y, e.stageX - this.x)*180/Math.PI;
		}
		
		internal function shoot(e:MouseEvent):void {
			
			var gunPoint:Point = new Point(this.gun.x, this.gun.y);
			gunPoint = this.localToGlobal(gunPoint);
			var b:Bullet = new Bullet(parent.stage,gunPoint,this.rotation);
			
			noise.play();
			
		}
		
		internal function setKeyboardFlags(e:KeyboardEvent):void {
            
			var key:String = String.fromCharCode(e.charCode);
			
			switch(key){
				
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
			
		internal function resetKeyboardFlags(e:KeyboardEvent):void {
				
			var key:String = String.fromCharCode(e.charCode);
				
			switch(key){
					
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
			
		internal function moveByKeyboard(e:Event):void {
				
			if(this.keyboardFlags.W){
				this.y -= this.speed;
			}
				
			if(this.keyboardFlags.A){
				this.x -= this.speed;
			}
				
			if(this.keyboardFlags.S){
				this.y += this.speed;
			}
				
			if(this.keyboardFlags.D){
				this.x += this.speed;
			}
				
		}
		
	}
	
}
