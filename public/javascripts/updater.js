document.observe("dom:loaded", function() {
//  setTimeout(function() {
//    console.log('init updater');
//    console.log(updateUrl);
//    new Ajax.PeriodicalUpdater('messages_placeholder', updateUrl, {
//      method: 'get',
//      frequency: 10,
//      onCreate: function(){$('spinner').show()},
//      onComplete: function(){$('spinner').hide()}
//    });
//  }, 3000);

  new Ajax.PeriodicalUpdater('messages_placeholder', updateUrl, {
      method: 'get',
      frequency: 15,
      onCreate: function() { $('spinner').show() },
      onSuccess: function() { $('spinner').hide() }
    });
});