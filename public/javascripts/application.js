// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
	if ( $('input#item_name').length )
  	$("input#item_name").focus();
});

$(function () {  
  // add item form doubles as an ajax search form.  
	if ( $('#items_search').length ) {
	  $('input#item_name').keyup(function () {  
	  	$('#items_search input').val($('input#item_name').val())
		  $.get($('#items_search').attr('action'), 
		    $('#items_search').serialize(), null, 'script');  
		  return false;  
	  });  
  };  
});
