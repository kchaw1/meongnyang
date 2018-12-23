$(function(){
  var $loginMsg = $('.loginMsg'),
  $login = $('.login'),
  $signupMsg = $('.signupMsg'),
  $signup = $('.signup'),
  $frontbox = $('.frontbox');

$('#switch1').on('click', function() {
  $loginMsg.addClass("visibility");
  $frontbox.addClass("moving");
  $signupMsg.removeClass("visibility");

  $signup.removeClass('hide');
  $login.addClass('hide');
})

$('#switch2').on('click', function() {
  $loginMsg.removeClass("visibility");
  $frontbox.removeClass("moving");
  $signupMsg.addClass("visibility");

  $signup.addClass('hide');
  $login.removeClass('hide');
})

//setTimeout(function(){
//  $('#switch1').click()
//},1000)
//
//setTimeout(function(){
//  $('#switch2').click()
//},3000)
});