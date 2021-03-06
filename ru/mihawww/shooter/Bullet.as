﻿package  ru.mihawww.shooter{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	
	
	internal class Bullet extends MovieClip {
		
		protected var speed:Number = 15;
		protected var dx:Number = 0;
		protected var dy:Number = 0;
		
		public function Bullet(stage:Stage, gunPoint:Point, gunAngle:Number) {
			
			super();
			
			gunAngle = gunAngle*(Math.PI/180); //опять в радианы(((((
			
			this.x = gunPoint.x;
			this.y = gunPoint.y;
			this.dx = this.speed*Math.cos(gunAngle);
			this.dy = this.speed*Math.sin(gunAngle);
			
			this.addEventListener(Event.ENTER_FRAME, this.flyBullet);
			
			stage.addChild(this);
			
		}
		
		internal function flyBullet(e:Event):void {
			
			this.x += this.dx;
			this.y += this.dy;
			
			if(this.x > stage.stageWidth || this.x < 0 || this.y > stage.stageHeight || this.y < 0){
				
				parent.removeChild(this);
				this.removeEventListener(Event.ENTER_FRAME,this.flyBullet);
				delete this;
			}
		}
	}
}
