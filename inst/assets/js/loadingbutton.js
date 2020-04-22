


function LoadingButtons() {
  this.buttons = [];
}  

LoadingButtons.prototype.create = function (inputId, options) {
  var btn_value = 0;
  
  // find all loading buttons in the dom and remove any loading buttons from 
  // this.buttons that are not longer in the dom. By running this "garbage collection"
  // each time we add a new loading button to the dom we protect against the this.loadingButtons
  // object growing out of control as loading buttons are quickly added and removed from the dom
  // TODO: confirm that this "garbage collection" is working
  var allDOMLoadingButtons = $(document).find(".sf-loading-button");
  var loadingIds = [];
  for(var obj of allDOMLoadingButtons) {
    loadingIds.push(obj.id);
  }
  // if element in this.buttons represents a loadingButton that is no longer in the DOM
  // then remove it from this.buttons.  Also remove remove it if the button being added already
  // exists in this.buttons
  this.buttons = this.buttons.filter(obj => {
    return loadingIds.includes("sf-loading-button-" + obj.inputId) && (obj.inputId !== inputId);
  });
  
  
  this.buttons.push({inputId: inputId, options: options}); 
  
  // Allow Shiny session to start
  $(document).on('shiny:sessioninitialized', function() {
    // set the initial loading button value
    Shiny.setInputValue(inputId, btn_value);
  });
  
  // Disable button & change text
  $(document).on('click', "#" + inputId, function() {
    // increment the button value by 1.  This is consistent with how `shiny::actionButton`
    // value works.
    btn_value = btn_value + 1;
    Shiny.setInputValue(inputId, btn_value);

    var loading_button = $(this);

    loading_button.attr('disabled', true);
    loading_button.html('<i class="fas fa-' + options.loadingSpinner + ' fa-spin"></i> ' + options.loadingLabel);
    loading_button.attr('style', options.loadingStyle);
    loading_button.removeClass(options["class"]);
    loading_button.addClass(options.loadingClass);
  });
};

LoadingButtons.prototype.resetLoading = function (inputId) {
  // Escape characters that have special selector meaning in jQuery
  inputId = inputId.replace( /(:|\.|\[|\]|,)/g, "\\$1" );
  var loading_button = $("#" + inputId);
    
  // find the loading button options for the correct loadin button
  var hold = this.buttons.find(function(obj) {
    return obj.inputId === inputId;
  });
  var options_ = hold.options;
    
  // restore the active (i.e. non loading styles)
  loading_button.attr('disabled', false);
  loading_button.html(options_.label);
  loading_button.attr('style', options_.style);
  loading_button.removeClass(options_.loadingClass);
  loading_button.addClass(options_["class"]);
};

var loadingButtons = new LoadingButtons();

// event listeners
$(document).on('shiny:sessioninitialized', function() {
  // Reset button to original state
  Shiny.addCustomMessageHandler('resetLoadingButton', function(message) {
    loadingButtons.resetLoading(message.inputId);
  });
});
