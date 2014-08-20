var app = app || {};

app.CreatePub = Backbone.View.extend({
  tagName: 'div',

  events: {
    'click button': 'createPub'
  },

  initialize: function () {
    if (app.currentView) {
      app.currentView.remove();
    }
    app.currentView = this;
  },

  render: function () {
    var createPub = Handlebars.compile(app.templates.createPub);
    this.$el.html( createPub );
    this.$el.attr('id', 'create-pub');
    $('#content').html(this.el);
  },

  createPub: function () {
    // stops the form from submitting params with the button.
    event.preventDefault();
    // saves to the rails database
    // console.log($('#password').val())
    var newPub = new app.Pub({
      name: $('#name').val(),
      address: $('#address').val(),
      email: $('#email').val(),
      image: $('#image').val(),
      description: $('#description').val(),
      password: $('#password').val(),
      password_confirmation: $('#confirm_password').val(),
      is_pub: true
    });
    newPub.save();
    // adds to the backbone memory (browser)
    // app.users.add(newUser);
    // Send view to a users list
    app.router.navigate("pubs/list", true);
  }

});
