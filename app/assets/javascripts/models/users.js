var app = app || {};

app.User = Backbone.Model.extend({
  urlRoot: '/users',
  defaults: {
    first_name: 'defualt',
    last_name: 'defualt',
    username: 'defualt',
    email: 'defualt',
    password_digest: 'defualt',
    avatar: 'defualt',
    location: 'defualt',
    score: 'defualt'
  }
});

// newUser = new app.User({name: $('#name').val()});

