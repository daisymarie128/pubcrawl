$(document).ready(function () {

  app.templates = {
    loginBar: $('#login-bar-template').html(),
    loggedInBar: $('#logged-in-bar-template').html(),
    userNavBar: $('#user-nav-bar-template').html(),
    pubNavBar: $('#pub-nav-bar-template').html(),
    userView: $('#user-template').html(),
    createPub: $('#create-pub-template').html(),
    usersListView: $('#users-list-template').html(),
    pubsListView: $('#pubs-list-template').html(),
    loginView: $('#login-template').html(),
    createPubChallengeView: $('#pub-challenge-template').html(),
    addTask: $('#new-task-template').html(),
    pubChallengesListView: $('#pub-challenge-list-template').html(),
    usersAchievementsView: $('#user-achievements-list-template').html(),
    findPubView: $('#find-pub-template').html()
  }

  app.users = new app.Users();
  var userRequest = app.users.fetch();

  app.pubs = new app.Pubs();
  var pubRequest = app.pubs.fetch();

  app.pubChallenges = new app.PubChallenges();
  var challengeRequest = app.pubChallenges.fetch();



  $.when(userRequest, challengeRequest, pubRequest).done(function () {
    app.router = new app.Router();
    Backbone.history.start();
  });

  //Redirects to homepage when click on title.
  $('.title span').click(function(){
    window.location.replace("#");
  });
});
