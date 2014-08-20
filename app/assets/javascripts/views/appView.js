var app = app || {};

app.AppView = Backbone.View.extend({

  el: '#main',

  events: {
    'click logout': 'logout'
  },

  initialize: function () {

  },

  render: function () {

  },

  //
  createUser: function () {
    app.router.navigate("users/create", true);
  },

  createPub: function () {
    app.router.navigate("pubs/create", true);
  },

  createPubChallenge: function () {
    app.router.navigate("pub_challenges/create", true);
  },

  logout: function () {
    event.preventDefault();
    // i want this shit to just log the fuck out. why you no work!
    $.ajax('/session', {
      type: 'post',
      dataType: 'json',
      data: {
        _method: "delete"
      }
    }).done(function(){
      app.router.navigate("", true);
      // this.$el.html( loginBar );
      // this.$el.attr('id', 'loginBar');
      // $('#login-functions').html(this.el);

    })
  }

});

