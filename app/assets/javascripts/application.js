// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require social-share-button
//= require social-share-button/wechat
//= require turbolinks
//= require_tree .


$("document").ready(function(){

	////// NOTIFICATION BOX////////
	var notiVisible=false;
	$("#notificationbox").click(function(event)
		{
			event.stopPropagation();
			if(!notiVisible){
				notiVisible=true;
			$("#notifications").children().toggle();
		}
		else{
			$("#notifications").children().hide();
			notiVisible=false;
		}
	});
	$('body').click(function() {
		if(notiVisible){
			$("#notifications").children().hide();
			notiVisible=false;
		}

	});
	////////////////////////////////
	// $("a").click(function(event)
	// {
		
	// 	console.log("in the read func");
	// 	$.ajax({

	// 		url:'/notifications/read',
	// 		type:'POST',
	// 		data: {
	// 			notification_id: this.id
	// 		},
	// 		success:function()
	// 		{
	// 			console.log("here i am");
	// 		}
	// 	});
	// });
	// $( "a" ).click(function( event ) {
 //  event.preventDefault();
 // });


});

// $( "a" ).click(function( event ) {
//   event.preventDefault();
//   $( "<div>" )
//     .append( "default " + event.type + " prevented" )
//     .appendTo( "#log" );
