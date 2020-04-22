


  
loadingButtons = []

function loadingButton(inputId, options) {
  
  var btn_value = 0
  
  loadingButtons.push({inputId, options: options})
  
  // Allow Shiny session to start
  $(document).on('shiny:sessioninitialized', function() {
    // set the initial loading button value
    Shiny.setInputValue(inputId, btn_value, { priority: 'event' });
  });

  // Disable button & change text
  $(document).on('click', "#" + inputId, function() {
    // increment the button value by 1.  This is consistent with how `shiny::actionButton`
    // value works.
    btn_value = btn_value + 1
    Shiny.setInputValue(inputId, btn_value, { priority: 'event' });

    var loading_button = $(this)

    loading_button.attr('disabled', true);
    loading_button.html('<i class="fas fa-' + options.loadingSpinner + ' fa-spin"></i> ' + options.loadingLabel);
    loading_button.attr('style', options.loadingStyle);
    loading_button.removeClass(options["class"]);
    loading_button.addClass(options.loadingClass);
  });
  
  function resetLoading(id_) {
    var loading_button = $("#" + id_)
    
    // find the loading button options for the correct loadin button
    var hold = loadingButtons.find(function(obj) {
      return obj.inputId === id_
    })
    var options_ = hold.options
    
    // restore the active (i.e. non loading styles)
    loading_button.attr('disabled', false);
    loading_button.html(options_.label);
    loading_button.attr('style', options_.style);
    loading_button.removeClass(options_.loadingClass);
    loading_button.addClass(options_["class"]);
  }
  
  // Reset button to original state
  Shiny.addCustomMessageHandler('resetLoadingButton', function(message) {
    
    resetLoading(message.inputId)
  });
  
  // Reset button to original state w/ JS command 
  //$(document).on("shinyfeedback:resetLoadingButton", function(event) {
  //  resetLoading(inputId)
  //})
  
}