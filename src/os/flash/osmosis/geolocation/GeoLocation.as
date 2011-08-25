/*
* Copyright (C) 2011 by Nuno Rosa (nuno.sp.rosa@gmail.com)
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/
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
		public static const FEATURE_NAMESPACE:String = "geolocation";
		
		private var featureInstance:String;
		
		public function GeoLocation(osmosisInstance:String)
		{
			super();
			this.featureInstance = osmosisInstance + "." + FEATURE_NAMESPACE;
			initialize();
		}
		
		private function initialize():void 
		{
			ExternalInterface.addCallback("onGeoLocationSucess", onGeoLocationSucess);
			ExternalInterface.addCallback("onGeoLocationError", onGeoLocationError);
		}
		
		public function isSupported():Boolean {
			return ExternalInterface.call(featureInstance + ".isSupported");
		}
		
		public function requestCurrentPosition(options:GeoLocationOptions = null):void {
			if(options == null){
				ExternalInterface.call(featureInstance + ".getCurrentPosition");
			}else {
				ExternalInterface.call(featureInstance + ".getCurrentPosition", options.toString());
			}
		}
		
		public function watchPosition(options:GeoLocationOptions = null):int{
			if(options == null){
				return ExternalInterface.call(featureInstance + ".watchPosition");
			}else {
				return ExternalInterface.call(featureInstance + ".watchPosition", options.toString());
			}
		}
		
		public function clearWatch(id:int):void {
			ExternalInterface.call(featureInstance + ".clearWatch", id);
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