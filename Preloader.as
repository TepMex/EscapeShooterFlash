package
{
	import flash.display.MovieClip;
	
	public class Preloader extends MovieClip
	{
		
		import flash.display.StageScaleMode;
		import flash.events.ProgressEvent;
		import flash.events.Event;
		import flash.events.MouseEvent;
		
		public function Preloader():void
		{
			stop();
			
			super();
			
			loadBar.scaleX = 0.0;
			startButton.visible = false;
			
			stage.showDefaultContextMenu = false;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.tabChildren = false;
			stage.stageFocusRect = false;
			stage.focus = stage;
			stage.quality = "high";
			
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress, false, 0, true);
			loaderInfo.addEventListener(Event.COMPLETE, onComplete, false, 0, true);
			
		}
		
		private function onProgress(e:ProgressEvent):void
		{
			
			loadBar.scaleX = e.bytesLoaded / e.bytesTotal;
			
		}
		
		private function onComplete(e:Event):void
		{
			
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			loaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			
			startButton.visible = true;
			startButton.addEventListener(MouseEvent.CLICK, onClickStart, false, 0, true);
			
		}
		
		private function onClickStart(e:MouseEvent):void
		{
			
			startButton.removeEventListener(MouseEvent.CLICK, onClickStart);
			gotoAndStop("Game");
			
		}
		
	}

}