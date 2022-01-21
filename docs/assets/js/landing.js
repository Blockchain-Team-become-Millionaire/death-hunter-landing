const hero = {
  adonis: {
    description:
      "Adonis has the special ability of his gauntlet that can generate super-high voltage electric currents, creating fire that melts metal. Duncan also apparates to go underground. He can even live without air for hours. Duncan's skin is very hard against metal, but is easily damaged by water.",
    strength: 70,
    agility: 30,
    defense: 55,
    health: 80,
  },
  ducan: {
    description:
      "Duncan has the special ability of his gauntlet that can generate super-high voltage electric currents, creating fire that melts metal. Duncan also apparates to go underground. He can even live without air for hours. Duncan's skin is very hard against metal, but is easily damaged by water.",
    strength: 30,
    agility: 70,
    defense: 80,
    health: 55,
  },
  joyce: {
    description:
      "Joyce has the special ability of his gauntlet that can generate super-high voltage electric currents, creating fire that melts metal. Duncan also apparates to go underground. He can even live without air for hours. Duncan's skin is very hard against metal, but is easily damaged by water.",
    strength: 55,
    agility: 33,
    defense: 28,
    health: 70,
  },
  selina: {
    description:
      "Selina has the special ability of his gauntlet that can generate super-high voltage electric currents, creating fire that melts metal. Duncan also apparates to go underground. He can even live without air for hours. Duncan's skin is very hard against metal, but is easily damaged by water.",
    strength: 90,
    agility: 32,
    defense: 55,
    health: 57,
  },
  sunhee: {
    description:
      "Sunhee has the special ability of his gauntlet that can generate super-high voltage electric currents, creating fire that melts metal. Duncan also apparates to go underground. He can even live without air for hours. Duncan's skin is very hard against metal, but is easily damaged by water.",
    strength: 30,
    agility: 83,
    defense: 27,
    health: 34,
  },
  thienbao: {
    description:
      "Thien Bao has the special ability of his gauntlet that can generate super-high voltage electric currents, creating fire that melts metal. Duncan also apparates to go underground. He can even live without air for hours. Duncan's skin is very hard against metal, but is easily damaged by water.",
    strength: 5,
    agility: 20,
    defense: 10,
    health: 98,
  },
};

$(document).ready(function () {
  AOS.init();
  initHeroSection();
});

function initHeroSection() {
  $("[data-hero]").click(function () {
    const heroId = this.attributes["data-hero"].value;
    $("#hero-idle").attr("src", `assets/images/animations/${heroId}-idle.gif`);
    $("#hero-name").text(heroId);
    $("#hero-description").text(hero[heroId].description);
    $("#hero-strength").css("width", `${hero[heroId].strength}%`);
    $("#hero-agility").css("width", `${hero[heroId].agility}%`);
    $("#hero-defense").css("width", `${hero[heroId].defense}%`);
    $("#hero-health").css("width", `${hero[heroId].health}%`);

    $("[data-hero]").removeClass("active");
    $(this).addClass("active");
  });
}
