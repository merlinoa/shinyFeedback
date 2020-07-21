
Shiny.addCustomMessageHandler(
  "toastr",
  function(message) {
    
    toastr[message.type](
      message.message,
      message.title,
      message.options
    );
  }
);

Shiny.addCustomMessageHandler(
  "hide_toastr",
  function(message) {
    
    if (message.animate) {
      toastr.clear();
    } else {
      toastr.remove();
    }
    
  }
);
