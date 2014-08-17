$(document).ready(function () {

  app.templates = {
    userView: $('#user-template').html(),
    usersListView: $('#users-list-template').html(),
    loginView: $('#login-template').html()
  }

  app.router = new app.Router();
  Backbone.history.start();
});
