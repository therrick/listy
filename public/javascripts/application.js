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
	  	$('#items_search input#search').val($('input#item_name').val())
		  $.get($('#items_search').attr('action'), 
		    $('#items_search').serialize(), null, 'script');  
		  return false;  
	  });  
  };  
});

$(function () {  
  $('#items th a').live('click', 
    function () {  
			if (this.href.search("pop") > -1) {
	  		$('#items_search input#sort').val("pop")
	  		$('#new_item input#sort').val("pop")
			} else {
  			$('#items_search input#sort').val("name")
	  		$('#new_item input#sort').val("name")
			}
      $.getScript(this.href);  
      return false;  
    }  
  );  
});