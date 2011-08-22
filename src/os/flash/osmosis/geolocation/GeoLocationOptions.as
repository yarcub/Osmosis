package os.flash.osmosis.geolocation 
{
	/**
	 * @see http://dev.w3.org/geo/api/spec-source.html#position-options
	 *
	 * @author Nuno Rosa
	 */
	public class GeoLocationOptions 
	{
		private var _enableHighAccuracy:Boolean;
		private var _timeout:int;
		private var _maximumAge:int
		
		public function GeoLocationOptions(timeout:int, maximumAge:int, enableHighAccuracy:Boolean) 
		{
			_timeout = timeout;
			_maximumAge = maximumAge;
			_enableHighAccuracy = enableHighAccuracy;
		}
		
		public function get enableHighAccuracy():Boolean 
		{
			return _enableHighAccuracy;
		}
		
		public function get timeout():int 
		{
			return _timeout;
		}
		
		public function get maximumAge():int 
		{
			return _maximumAge;
		}
		
		public function toString():String {
			var json:String = "{enableHighAccuracy: " + enableHighAccuracy;
			json += ",timeout: " + timeout;
			json += ",maximumAge: " + maximumAge + "}";
			
			return json;
		}
	}

}