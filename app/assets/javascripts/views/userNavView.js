var app = app || {};

app.UserNavView = Backbone.View.extend({
  el: '#login-functions',

  events: {
    'click .logout': 'logout'
  },

  initialize: function () {
    // if (app.currentView) {
    //   app.currentView.remove();
    // }
    // app.currentView = this;
  },

  logout: function (event) {
    console.log('logot starting');
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
      app.currentUser = null
      $('#login-functions').html( loginBar );
      app.router.navigate("", true);
    }).fail(function() {
      console.log('logout failed');
    })
  },

  render: function () {
    if (app.currentUser){
      console.log('uservanview')
      var loggedInBar = Handlebars.compile(app.templates.loggedInBar);
      $('#login-functions').html( loggedInBar );
    }else{
      var loginBar = Handlebars.compile(app.templates.loginBar);
      $('#login-functions').html( loginBar );
    }

  }
});
