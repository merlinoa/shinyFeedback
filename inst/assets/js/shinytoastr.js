
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
