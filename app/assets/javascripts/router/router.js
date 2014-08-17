var app = app || {};

app.Router = Backbone.Router.extend({
  routes: {
    '': 'index',
    'users/create': 'createUser',
    'users/list': 'viewUsers',
    'login': 'login'
  },

  initialize: function () {
    app.users = new app.Users();
    app.users.fetch();
  },

  index: function () {
    if (app.currentView) {
      app.currentView.remove();
    }
    var appView = new app.AppView()
    appView.render();
  },

  createUser: function () {
    var userView = new app.UserView();
    userView.render();
  },

  viewUsers: function () {
    var usersListView = new app.UsersListView();
    usersListView.render();
  },

  login: function () {
    var loginView = new app.LoginView();
    loginView.render();
  }
});


