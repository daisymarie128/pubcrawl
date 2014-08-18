var app = app || {};

app.LoginView = Backbone.View.extend({
  tagName: 'div',

  events: {
    'click button': 'login'
  },

  initialize: function () {
    if (app.currentView) {
      app.currentView.remove();
    }
    app.currentView = this;
  },

  render: function () {
    var loginView = Handlebars.compile(app.templates.loginView);
    this.$el.html( loginView );
    this.$el.attr('id', 'login-view');
    $('#content').html(this.el);
  },

  login: function () {
    // stops the form from submitting params with the button.
    event.preventDefault();
    // saves to the rails database
    $.ajax('/session', {
      type: 'post',
      dataType: 'json',
      data: {
        username: $('#username').val(),
        password: $('#password').val()
      }
    }).done(function(){
      console.log('working?')
      this.$el.html( loginBar );
      this.$el.attr('id', 'loginBar');
      $('#login-functions').html(this.el);
    })
    // if (sign in is right){
    //   app.router.navigate("users/list", true);
    // }else{
    //   alert('your a fucking idiot')
    // }
    // var userLogin = new app.Session({
    //   username: $('#username').val(),
    //   password: $('#password').val()});
    // userLogin.save();
    // // adds to the backbone memory (browser)
    // //i dont know what should actually go here!
    // // app.users.add(newUser);
    // // Send view to a users list
    // app.router.navigate("users/list", true);
  }

});