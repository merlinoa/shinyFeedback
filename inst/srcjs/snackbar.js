(function() {
  
  function showSnackbar(id, autoHideDuration) {

    // Get the snackbar DIV
    var snackEl = $("#" + id);

    // Add the "show" class to DIV
    snackEl.fadeIn("slow");

    // After 3 seconds, remove the show class from DIV
    
    if (autoHideDuration !== null) {
      setTimeout(function() {
        snackEl.fadeOut("slow");
      }, autoHideDuration);  
    }
    
    
    var removeBtn = $("#" + id + "_remove_btn");
    
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
