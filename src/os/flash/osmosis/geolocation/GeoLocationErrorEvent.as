package os.flash.osmosis.geolocation 
{
	import flash.events.Event;
	
	/**
	 * Event triggered whenever an error occured with a position request
	 * 
	 * Similar to Geolocation position error object interface
	 * @see http://dev.w3.org/geo/api/spec-source.html#position_error_interface
	 * 
	 * @author Nuno Rosa
	 */
	public class GeoLocationErrorEvent extends Event 
	{
		public static const ERROR:String = "os.flash.osmosis.geolocation.GeoLocationEvent.ERROR";
		
		public static const PERMISSION_DENIED:int = 1;
		public static const POSITION_UNAVAILABLE:int = 2;
		public static const TIMEOUT:int = 3;
		
		private var _code:int;
		private var _message:String;
		
		public function GeoLocationErrorEvent(type:String, code:int, message:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			this._code = code;
			this._message = message;
		} 
		
		public override function clone():Event 
		{ 
			return new GeoLocationErrorEvent(type, code, message, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("GeoLocationErrorEvent", "type", "code", "message", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get code():int 
		{
			return _code;
		}
		
		public function get message():String 
		{
			return _message;
		}
		
	}
	
}