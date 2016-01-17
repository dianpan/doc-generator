$(document).ready(function() {

    //custom validations
    $.validator.addMethod("greaterThanZero", function(value, element) {
      return this.optional(element) || (parseFloat(value) > 0);
    }, "* Loan amount must be greater than $0");

    $.validator.addMethod("greaterThanOrEqualToZero", function(value, element) {
      return this.optional(element) || (parseFloat(value) >= 0);
    }, "* Amount must be at least 0");


  $("#documentForm").validate({
    rules: {
      "document[loan_amount]": {
        required: true,
        amount: { greaterThanZero: true }
      }
      "document[down_payment]": {
        required: true,
        amount: { greaterThanOrEqualToZero: true }
      },
      "document[interest_rate]": {
        required: true,
        amount: { greaterThanOrEqualToZero: true }
      }
    },
    highlight: function(element) {
      $(element).closest('.form-group').addClass('error');
    },
    success: function(element) {
      element.addClass('valid').closest('.form-group').removeClass('error').addClass('success');
    },
    submitHandler: function(form) {
      $.ajax({
        type: form.attr('method'),
        // url: "../php/client/json.php",
        data: form.serialize(),
        success: function(data, status) {
          $(this).modal('hide');
        }
    });
      return false;
    }
  });
});


// $.validator.addMethod("greaterThanZero", function(value, element) {
//   return this.optional(element) || (parseFloat(value) > 0);
// }, "* Loan amount must be greater than $0");

//   $('#documentForm').validate({
//     rules: {
//       amount: { greaterThanZero: true }
//     }
//   });

// function validateForm() {
//   // return false;
//   if (document.errors.any?) {
//     alert();
//     return false; //suppresses form submission
//   } else {
//     return true; //form will submit
//   }
// }

