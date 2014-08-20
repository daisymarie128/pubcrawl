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
    pubChallengesListView: $('#pub-challenge-list-template').html(),
    findPubView: $('#find-pub-template').html()
  }

  app.users = new app.Users();
  var userRequest = app.users.fetch();

  app.pubs = new app.Pubs();
  var pubRequest = app.pubs.fetch();

  app.pubChallenges = new app.PubChallenges();
  var challengeRequest = app.pubChallenges.fetch();

  // app.current_user = null;
  //   $.ajax('http://fierce-river-3029.herokuapp.com/users.json', {
  //     type: 'get',
  //     dataType: 'json',
  //     data: {
  //       user: is_pub
  //       // app.current_user = data.user
  //     }
  //   }




    // app.current_user.role


  $.when(userRequest, challengeRequest, pubRequest).done(function () {
    app.router = new app.Router();
    Backbone.history.start();
  });
});
