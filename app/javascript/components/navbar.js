const klickBurgerMenu = () => {
$("#toggle").click(function() {
  //on click, the hamburger menu elements get the toggle-active class and the overlay gets the nav-active class
  $(this).toggleClass("toggle-active");
  $("#overlay").toggleClass("nav-active");
  $("body").toggleClass("prevent-scroll");

  //the h1 element toggles between visibility and invisibility
  $("h1").toggleClass("hidden");
});
}

export { klickBurgerMenu };
