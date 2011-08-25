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