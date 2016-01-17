$(document).ready(function() {

    //custom validations
    $.validator.addMethod("greaterThanZero", function(value, element) {
      return this.optional(element) || (parseFloat(value) > 0);
    }, "* Loan amount must be greater than $0");

    $.validator.addMethod("greaterThanOrEqualToZero", function(value, element) {
      return this.optional(element) || (parseFloat(value) >= 0);
    }, "* Amount must be at least 0");

  $("#documentForm").validate({
    // debug: true,
    rules: {
      "document[loan_amount]": {
        required: true,
        min: 1
        // amount: { greaterThanZero: true }
      }
      "document[down_payment]": {
        required: true,
        min: 0
        // amount: { greaterThanOrEqualToZero: true }
      },
      "document[interest_rate]": {
        required: true,
        range: [0,1000]
        // amount: { greaterThanOrEqualToZero: true }
      }
    }
    // submitHandler: function(form) {
    //   $.ajax({
    //     type: "post",
    //     // url: "../php/client/json.php",
    //     data: form.serialize(),
    //     success: function(data, status) {
    //       $(this).modal('hide');
    //     }
    // });
    //   return false;
    // }
  });
});



// function validateForm() {
//   // return false;
//   if (document.errors.any?) {
//     alert();
//     return false; //suppresses form submission
//   } else {
//     return true; //form will submit
//   }
// }

