var app = app || {};

app.UserNavView = Backbone.View.extend({
  el: '#user-bar',

  events: {

  },

  initialize: function () {
    // if (app.currentView) {
    //   app.currentView.remove();
    // }
    // app.currentView = this;
  },

  render: function () {
    if (app.currentUser){
      console.log('is this even working?')
      var loggedInBar = Handlebars.compile(app.templates.loggedInBar);
      $('#user-bar').append( loggedInBar );
    }else{
      var loginBar = Handlebars.compile(app.templates.loginBar);
      $('#user-bar').append( loginBar );
    }

  }
});
