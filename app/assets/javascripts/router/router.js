var app = app || {};

app.Router = Backbone.Router.extend({
  routes: {
    '': 'index',
    'login': 'login',
    'users/create': 'createUser',
    'users/edit': 'editUser',
    'users/list': 'viewUsers',
    'pubs/create': 'createPub',
    'pubs/list': 'viewPubs',
    'pub_challenges/create': 'createPubChallenges',
    'tasks/create': 'createTask',
    'pub_challenges/list': 'pubChallengesListView',
    'pub_challenges/:id': 'pubChallengesListSpecific',
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
    var landingView = new app.LandingView()
    landingView.render();

  },

  createUser: function () {
    var userView = new app.UserView();
    userView.render();
  },

  editUser: function () {
    if (app.currentUser.type == 'user') {
      var userView = new app.UserView();
    } else {
      var userView = new app.CreatePub();
    }
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

  createTask: function () {
    var createTaskView = new app.TaskCreateView();
    createTaskView.render();
  },

  pubChallengesListView: function () {
    var pubChallengesListView = new app.PubChallengesListView();
    pubChallengesListView.render();
  },

  pubChallengesListSpecific: function (id) {
    var pub = app.pubs.get(id)
    var pubChallengesListSpecific = new app.PubChallengesListSpecific({model: pub });
    pubChallengesListSpecific.render();
  },

  login: function () {
    var loginView = new app.LoginView();
    loginView.render();
  },

  findPubView: function () {
    var findPubView = new app.FindPubView();
    findPubView.render();
  }
});


