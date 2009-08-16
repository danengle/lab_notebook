// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
	$('#wysiwyg').wysiwyg();
	$('#q').autocomplete("/search", {
		width: 260,
		selectFirst: false
	});
	$("#q").result(function(event, data, formatted) {
		if (data) {
			$(this).parent().next().find("input").val(data[1]);
		}
	});
});
jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})