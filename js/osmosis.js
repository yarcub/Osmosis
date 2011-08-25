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

(function() {
	Osmosis = function(flashid){
		this.geolocation = new Geolocation(flashid);
		return this;
	}
	
	var Geolocation = function(flashid){
		this.flashmovie = document.getElementById(flashid);
		return this;
	}
	
	Geolocation.prototype.isSupported = function(){
		return navigator.geolocation != undefined;
	}
	
	Geolocation.prototype.getCurrentPosition = function(options){
		var element = this.flashmovie;
		navigator.geolocation.getCurrentPosition(
		function(position){
			element.onGeoLocationSucess(position);
		}, 
		function(error){
			element.onGeoLocationError(error);
		}, options);
	}
	
	Geolocation.prototype.watchPosition = function(options){
		var element = this.flashmovie;
		var watchId = navigator.geolocation.watchPosition(
		function(position){
			element.onGeoLocationSucess(position);
		}, 
		function(error){
			element.onGeoLocationError(error);
		}, options);
		
		return watchId;
	}
	
	Geolocation.prototype.clearWatch = function(id){
		navigator.geolocation.clearWatch(id);
	}
})();