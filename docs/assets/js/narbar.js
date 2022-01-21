let mobileActive = false;

$(document).ready(function () {
  $("#navbar-toggler").click(function () {
    if (mobileActive) {
      $("nav ul").addClass("h-0").removeClass("h-[calc(100vh-72px)]");
      mobileActive = false;
    } else {
      $("nav ul").removeClass("h-0").addClass("h-[calc(100vh-72px)]");
      mobileActive = true;
    }
  });
});
