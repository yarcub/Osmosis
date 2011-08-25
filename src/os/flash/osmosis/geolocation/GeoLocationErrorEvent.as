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