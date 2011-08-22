/**
 * ...
 * @author Nuno Rosa
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