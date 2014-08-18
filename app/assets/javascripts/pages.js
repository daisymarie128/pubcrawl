$(document).ready(function () {

  app.templates = {
    loginBar: $('#login-bar-template').html(),
    userView: $('#user-template').html(),
    usersListView: $('#users-list-template').html(),
    loginView: $('#login-template').html(),
    createPubChallengeView: $('#pub-challenge-template').html(),
    pubChallengesListView: $('#pub-challenge-list-template').html()
  }

  app.router = new app.Router();
  Backbone.history.start();
});
