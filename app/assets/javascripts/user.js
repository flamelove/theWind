$(document).ready(function(){
  //javascript for sighIn
  $(".login_form").validate({
  rules: {
    // simple rule, converted to {required:true}
     "user[username]": {
        required:true
          },
    // compound rule
     "user[password]" : {
       required:true,
       minlength: 8
       }
  }
  });
  // javascript for edit user
  $(".edit_user").validate({
  rules: {
      "user[email]" :{
        required: true,
        email:true
      },
    // compound rule
     "user[password]" : {
       required:true,
       minlength: 8
       },
      "user[current_password]":{
        required:true
      }
  }
  });
  // Signup form
   $(".signup-form").validate({
  rules: {
    // simple rule, converted to {required:true}
     "user[username]": {
        required:true
          },
      "user[email]" :{
        required: true,
        email:true
      },
    // compound rule
     "user[password]" : {
       required:true,
       minlength: 8
       }
  }
  });
});