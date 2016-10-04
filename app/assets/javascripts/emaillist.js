$(document).ready(function(){
  $('form#subscribe')
    .bind("ajax:beforeSend", function(eat, xor, settings){
      var $divResponse = $('div#response');
      $divResponse.data( 'origText', $divResponse.text() );
      $divResponse.text( "Adding Email…" );
    })
    .bind("ajax:success", function(eat, data, status, xor){
      var $form = $(this);
      var $divResponse = $('div#response');
      $form.find('input[type="email"]').val("");
      $divResponse.html(data.message);
    })
    .bind('ajax:complete', function(eat, xor, status){
      var $divResponse = $('div#response');
    })
    .bind("ajax:error", function(eat, xor, status, error){
       var $divResponse = $('div#response'),
          errors,
          errorText,
      errorList;
      try {
        errors = $.parseJSON(xhr.responseText);
      } catch(err) {
        errors = {message: "Please reload the page and try again"};
      }
      errorText = "There were errors with the submission. Please reload the page and try again.";
      errorList = "<ul>"
      for ( error in errors ) {
        errorList += "<li>" + error + ': ' + errors[error] + "</li> ";
      }
      errorList += "</ul>";
      $divResponse.html(errorText);
    });
});