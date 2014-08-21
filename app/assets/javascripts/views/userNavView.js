var app = app || {};

app.UserNavView = Backbone.View.extend({
  el: '#user-bar',

  events: {
    'click button': '#logout'
  },

  initialize: function () {
    // if (app.currentView) {
    //   app.currentView.remove();
    // }
    // app.currentView = this;
  },

  logout: function (event) {
    console.log('sdfsdf');
    event.preventDefault();
    // i want this shit to just log the fuck out. why you no work!
    $.ajax('/session', {
      type: 'post',
      dataType: 'json',
      data: {
        _method: "delete"
      }
    }).done(function(){
      console.log('logging out and changing nav')
      var loginBar = Handlebars.compile(app.templates.loginBar);
      $('#user-bar').append( loginBar );
      app.router.navigate("", true);
      console.log('this should not happen')
    }).fail(function() {
      console.log('you failed');
    })
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
