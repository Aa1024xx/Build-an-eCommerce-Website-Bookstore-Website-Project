 $(document).ready(function(){
	  $("#customerForm").validate({
		rules: {
			
			email: {
				required: true,
	            email: true
			},
			
			firstName: "required",
			lastName: "required",
			password: "required",
			ConfirmPassword:{
				required: true,
				equalTo: "#password"
				
			},
			phone: "required",
			address1: "required",
			address2: "required",
			city: "required",
			state: "required",
			zipCode: "required",
			country: "required",
		},
		
		messages: {
			
			email: {
				required: "Please enter e-mail address",
				email: "Please enter a valid e-mail address"
			},
			firstName: "Please enter first name",
			lastName: "Please enter last name",
			password: "Please enter password",
			ConfirmPassword: {
				required: "Please confirm password",
				equalTo: "Confrim password does not match password"
			},
			phone: "Please enter phone number",
			address1: "Please enter address line 1",
			address2: "Please enter address line 2",
			city: "Please enter city",
			state: "Please enter state",
			zipCode: "Please enter zip code",
			country: "Please enter country",
		}
	});
	
	$("#buttonCancel").click(function(){
		history.go(-1);
	});
});