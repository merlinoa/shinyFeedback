
Shiny.addCustomMessageHandler(
  "toastr",
  function(message) {
    
    debugger;
    
    toastr[message.type](
      message.message,
      message.title,
      message.options
    );
  }
);
