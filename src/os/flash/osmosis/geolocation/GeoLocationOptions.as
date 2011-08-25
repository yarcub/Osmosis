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