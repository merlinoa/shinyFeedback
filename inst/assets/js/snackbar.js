;(function() {
  
  function escapeId(inputId) {
    // from https://github.com/daattali/advanced-shiny/blob/master/update-input/www/app-shinyjs.js
    // Escape characterss that have special selector meaning in jQuery
    return inputId.replace( /(:|\.|\[|\]|,)/g, "\\$1" );
    
    //return inputId;//$("#" + inputId);
  }
  
  function showSnackbar(id, autoHideDuration) {

    // Get the snackbar DIV
    var idEscaped = escapeId(id);
    var snackEl = $("#" + idEscaped);

    // Add the "show" class to DIV
    snackEl.fadeIn("slow");
    
    // After 3 seconds, remove the show class from DIV
    if (autoHideDuration !== null) {
      setTimeout(function() {
        snackEl.fadeOut("slow");
      }, autoHideDuration);  
    }
    
    
    var removeBtn = $("#" + idEscaped + "_remove_btn");
    
    removeBtn.click(function() {
      snackEl.fadeOut("slow");
    });
  }


  Shiny.addCustomMessageHandler("showSnackbar",
    function(message) {
      showSnackbar(message.id, message.autoHideDuration);
    }
  );
  
})();
