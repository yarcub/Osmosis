package os.flash.osmosis.geolocation
{
	
	/**
	 * @see http://dev.w3.org/geo/api/spec-source.html#position_interface
	 * 
	 * @author Nuno Rosa
	 */
	public class Coordinates
	{
		private var _accuracy:Number;
		private var _altitude:Number;
		private var _altitudeAccuracy:Number;
		private var _heading:Number;
		private var _latitude:Number;
		private var _longitude:Number;
		private var _speed:Number;
		
		public function Coordinates(accuracy:Number, latitude:Number, longitude:Number, altitude:Number = NaN, altitudeAccuracy:Number = NaN, heading:Number = NaN, speed:Number = NaN)
		{
			this._accuracy = accuracy;
			this._latitude = latitude;
			this._longitude = longitude;
			this._altitude = altitude;
			this._altitudeAccuracy = altitudeAccuracy;
			this._heading = heading;
			this._speed = speed;
		}
		
		public function get accuracy():Number
		{
			return _accuracy;
		}
		
		public function get altitude():Number
		{
			return _altitude;
		}
		
		public function get altitudeAccuracy():Number
		{
			return _altitudeAccuracy;
		}
		
		public function get heading():Number
		{
			return _heading;
		}
		
		public function get latitude():Number
		{
			return _latitude;
		}
		
		public function get longitude():Number 
		{
			return _longitude;
		}
		
		public function get speed():Number 
		{
			return _speed;
		}
	
	}

}