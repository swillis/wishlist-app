



jQuery(document).ready(function() {
    
    $("#new_wish").validate({
        rules: {
            wish_title: "required",
            wish_description: "required",
            status: "required",
            close_date: "required",
	    wish_close_date_1i: "required",
	    wish_close_date_2i: "required",
	    wish_close_date_3i: "required"
        },
        
        messages: {
			wish_title: "Please enter a valid title",
			description: "Please enter valid description of atleast 10 characters",
			status: "Please check atleast one status",
			close_date: "Please enter estimated completion date"	
			
		}
        
        
        
    });
    
    
    
    $("#new_item").validate({
  
})
    
  $("#new_user").validate({
  
})

});
