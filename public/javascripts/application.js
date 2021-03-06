// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// This sets up the proper header for rails to understand the request type,
// and therefore properly respond to js requests (via respond_to block, for example)
$.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {

  // UJS authenticity token fix: add the authenticy_token parameter
  // expected by any Rails POST request.
  $(document).ajaxSend(function(event, request, settings) {
    // do nothing if this is a GET request. Rails doesn't need
    // the authenticity token, and IE converts the request method
    // to POST, just because - with love from redmond.
    if (settings.type == 'GET') return;
    if (typeof(AUTH_TOKEN) == "undefined") return;
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });

});

// focus cursor in form field 
$(function() {
	if ( $('input#item_name').length )
  	$("input#item_name").focus();
});

// do an ajax search on each key-press
$(function () {  
  // add item form doubles as an ajax search form.  
	if ( $('#items_search').length ) {
	  $('input#item_name').keyup(function () {  
	    delay(function(){
				filter_items('.item_list',$('input#item_name').val());
	    }, 500 );
		  return false;  
	  });  
  };  
});

function filter_items(selector, query) {  
  query =   $.trim(query); //trim white space  
  query = query.replace(/ /gi, '.*'); //allow space to match any characters  
  if (query.length > 0) {
		$("#item_table_headings").hide();
	} else {
		$("#item_table_headings").show();
	}
	
	// var Timer = T();
	// Timer.s("start");
	
  $(selector).each(function() {  
		($(this).find("td:nth-child(2)").text().search(new RegExp(query, "i")) < 0) ? $(this).css("display", "none") : $(this).css("display", "table-row");
		// $(this).hide() : $(this).show();  
  });  

	// alert(Timer.e());
}

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

// sort with ajax and keep other forms updated with appropriate sort params
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

// Return boolean TRUE/FALSE
function isIOS(){
    return (
        (navigator.platform.indexOf("iPhone") != -1) ||
        (navigator.platform.indexOf("iPad") != -1) ||
        (navigator.platform.indexOf("iPod") != -1)
    );
}


function T(){
	var a=[];						//Holds the timer stack
	return{
		s:function(n){					//Starts a new timer, pass in 'n' as the name of the timer
			a.unshift({n:n,t:new Date()})		//Puts the timer on top of the stack
		},
		e:function(l){					//Ends the most recently started timer
			l=a.shift();				//Gets the timer from top of the stack
			return((new Date()-l.t)+'ms|'+l.n)	//Returns elapsed milliseconds of named timer
		}
	}
}