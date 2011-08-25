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