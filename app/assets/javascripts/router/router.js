var app = app || {};

app.Router = Backbone.Router.extend({
  routes: {
    '': 'index',
    'login': 'login',
    'users/create': 'createUser',
    'users/list': 'viewUsers',
    'pubs/create': 'createPub',
    'pubs/list': 'viewPubs',
    'pub_challenges/create': 'createPubChallenges',
    'pub_challenges/list': 'pubChallengesListView',
    'pubs/find_pub': 'findPubView'
  },

  initialize: function () {
    var userNavView = new app.UserNavView();
    userNavView.render();

    var siteNavView = new app.SiteNavView();
    siteNavView.render();
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

  createPub: function () {
    var createPub = new app.CreatePub();
    createPub.render();
  },

  viewPubs: function () {
    var pubsListView = new app.PubsListView();
    pubsListView.render();
  },

  createPubChallenges: function () {
    var createPubChallengeView = new app.PubChallengesCreateView();
    createPubChallengeView.render();
  },

  pubChallengesListView: function () {
    var pubChallengesListView = new app.PubChallengesListView();
    pubChallengesListView.render();
  },

  login: function () {
    var loginView = new app.LoginView();
    loginView.render();
  },

  findPubView: function () {
    var findPubView = new app.FindPubView();
    findPubView.render();
    findPubView.display_map(-33.87, 151.21, 12);
  }
});


