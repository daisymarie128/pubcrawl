var app = app || {};

app.SiteNavView = Backbone.View.extend({
  el: '#site-navigation-bar',


  events: {

  },

  initialize: function () {
    if (app.currentView) {
      app.currentView.remove();
    }
    app.currentView = this;
  },

  render: function () {
    if (app.currentUser.type === 'pub'){
      var pubNavBar = Handlebars.compile(app.templates.pubNavBar);
      $('#site-navigation-bar').append( pubNavBar );
    }else{
      var userNavBar = Handlebars.compile(app.templates.userNavBar);
      $('#site-navigation-bar').append( userNavBar );
    }

  }
});
