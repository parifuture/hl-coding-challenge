$(document).ready(function() {
    $( "#new_uploaded_transaction" ).validate ({
        submitHandler: function(form) {
            form.submit();
        },
        errorElement: "div",
        errorPlacement: function ( error, element ) {
            // Add the `help-block` class to the error element
            error.addClass("alert alert-danger");
            error.insertAfter(element);
        },
    });
});
