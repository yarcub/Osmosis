package os.flash.osmosis.geolocation 
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.external.ExternalInterface
	
	/**
	 * Wrapper for Geolocation API
	 * 
	 * @see http://dev.w3.org/geo/api/spec-source.html
	 * @author Nuno Rosa
	 */
	public class GeoLocation extends EventDispatcher
	{	
		private var osmosisInstance:String;
		
		public function GeoLocation(osmosisInstance:String)
		{
			super();
			this.osmosisInstance = osmosisInstance + ".geolocation";
			initialize();
		}
		
		private function initialize():void 
		{
			ExternalInterface.addCallback("onGeoLocationSucess", onGeoLocationSucess);
			ExternalInterface.addCallback("onGeoLocationError", onGeoLocationError);
		}
		
		public function isSupported():Boolean {
			trace(osmosisInstance + "geolocation.isGeolocationSupported");
			return ExternalInterface.call(osmosisInstance + "geolocation.isSupported");
		}
		
		public function requestCurrentPosition(options:GeoLocationOptions = null):void {
			if(options == null){
				ExternalInterface.call(osmosisInstance + ".getCurrentPosition");
			}else {
				ExternalInterface.call(osmosisInstance + ".getCurrentPosition", options.toString());
			}
		}
		
		public function watchPosition(options:GeoLocationOptions = null):int{
			if(options == null){
				return ExternalInterface.call(osmosisInstance + ".watchPosition");
			}else {
				return ExternalInterface.call(osmosisInstance + ".watchPosition", options.toString());
			}
		}
		
		public function clearWatch(id:int):void {
			ExternalInterface.call(osmosisInstance + ".clearWatch", id);
		}
		
		private function onGeoLocationSucess(positionObj:Object):void {
			var position:Coordinates = new Coordinates(positionObj.coords.accuracy,
														positionObj.coords.latitude,
														positionObj.coords.longitude,
														positionObj.coords.altitude,
														positionObj.coords.altitudeAccuracy,
														positionObj.coords.heading,
														positionObj.coords.speed);
			
			dispatchEvent(new GeoLocationEvent(GeoLocationEvent.SUCCESS, positionObj.timestamp, position));
		}
		
		private function onGeoLocationError(errorObj:Object):void {
			dispatchEvent(new GeoLocationErrorEvent(GeoLocationErrorEvent.ERROR, errorObj.code, errorObj.message));
		}
		
	}

}