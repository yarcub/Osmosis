package os.flash.osmosis.geolocation 
{
	import flash.events.Event;
	
	/**
	 * Event triggered whenever a new position is available
	 * 
	 * @see http://dev.w3.org/geo/api/spec-source.html#position_interface
	 * 
	 * @author Nuno Rosa
	 */
	public class GeoLocationEvent extends Event 
	{
		public static const SUCCESS:String = "os.flash.osmosis.geolocation.GeoLocationEvent.SUCCESS";
		
		private var _timestamp:int;
		private var _coordinates:Coordinates;
		
		public function GeoLocationEvent(type:String, timestamp:int, coordinates:Coordinates,bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			this._timestamp = timestamp;
			this._coordinates = coordinates;
		} 
		
		public override function clone():Event 
		{ 
			return new GeoLocationEvent(type, timestamp, coordinates, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("GeoLocationEvent", "type", "timestamp", "coordinates", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get timestamp():int 
		{
			return _timestamp;
		}
		
		public function get coordinates():Coordinates 
		{
			return _coordinates;
		}
		
	}
	
}