(function() {

  var store = {
    // cache the validation state for each input with feedback
    isShown: {},
              
    add: function(feedbackId) {
      if (store.isShown[feedbackId] === undefined) {
         store.isShown[feedbackId] = false;
      }
    },
  
    toggle: function(feedbackId) {
      store.isShown[feedbackId] = !store.isShown[feedbackId];
    }
  };
  
  function showFeedback() {
    
  }
               
  this.shinyjs.checkFeedback = function(params) {
    var defaultParams = {
      inputId: null, 
      condition: null,
      text: null,
      color: null, 
      icon: null,
      feedbackId: null
    };

    params = shinyjs.getParams(params, defaultParams);
    
    var $input = $("#" + params.inputId);
    var $label = $input.siblings("label");
    var $formGroup = $input.parent();
    
    // add feedbackId to the store
    store.add(params.feedbackId);
    // remove feedback before showing it in case there
    // are multiple feedback options
    if (!params.condition && store.isShown[params.feedbackId]){
      // change input isShown store variable to false
      store.toggle(params.feedbackId);
      //console.log(params.feedbackId + "b");
      // remove feedback messages
      $input.removeAttr("style");
      $label.removeAttr("style");
      if (params.icon) {
        $("#" + params.inputId + "-icon").remove();
        $formGroup.removeClass("has-feedback");
      }
      if (params.text) {
        $("#" + params.inputId + "-text").remove();
        $("#"+ params.inputId +"-spacing").remove();  
      }
    }
    // if feedback should transition to shown
    if (params.condition && !store.isShown[params.feedbackId]) {
      // change input isShown store variable to false
      store.toggle(params.feedbackId);
      
      console.log(params.feedbackId);
      // display feedback
      $label.css("color", params.color);
      $input.css("border", "1px solid " + params.color);
      if (params.text) {
        $("<div id='" + params.inputId + "-text' class='col-xs-12'><p style='color: " + params.color +"; margin-bottom: 0px;'>"+ params.text +"</p></div><br id='" + params.inputId + "-spacing'/>").insertAfter($input);
      }
      
      if (params.icon) {
        $formGroup.addClass("has-feedback");
        $("<span id='" + params.inputId + "-icon' class='form-control-feedback' style='color: " + params.color + ";'>" + params.icon + "</span>")
        .insertAfter($input);
      }  
    }
  };
})();
