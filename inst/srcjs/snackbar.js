(function() {
  
  function showSnackbar(id) {

    // Get the snackbar DIV
    var snackEl = $("#" + id);

    // Add the "show" class to DIV
    snackEl.addClass("show");

    // After 3 seconds, remove the show class from DIV
    setTimeout(function() {
      snackEl.removeClass("show");
    }, 3000);
    
    
    var removeBtn = $("#" + id + "_remove_btn");
    
    removeBtn.click(function() {
      snackEl.removeClass("show");
    });
  }


  Shiny.addCustomMessageHandler("showSnackbar",
    function(message) {
      showSnackbar(message.id, message.autoHideDuration);
    }
  );
  
})();
