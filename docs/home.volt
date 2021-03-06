<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="apple-touch-icon" sizes="180x180" href="/frontend/assets/favicon/apple-touch-icon.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="/frontend/assets/favicon/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="/frontend/assets/favicon/favicon-16x16.png" />
    <link rel="manifest" href="/frontend/assets/favicon/site.webmanifest" />
    <link rel="mask-icon" href="/frontend/assets/favicon/safari-pinned-tab.svg" color="#5bbad5" />
    <link rel="shortcut icon" href="/frontend/assets/favicon/favicon.ico" />
    <meta name="msapplication-TileColor" content="#da532c" />
    <meta name="msapplication-config" content="/frontend/assets/favicon/browserconfig.xml" />
    <meta name="theme-color" content="#ffffff" />
    <link href="/frontend/assets/css/main.css?v=0.1.2" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>

    <title>Death Hunter - THE BEST IDLE RPG Game on blockchain</title>
  </head>
  <body>
    <div class="fixed z-30 w-full antialiased bg-[#181728] lg:bg-opacity-30">
      <div x-data="{ open: false }" class="container relative flex flex-col mx-auto lg:items-center lg:flex-row">
        <div class="flex flex-row items-center justify-between p-1 lg:p-3">
          <!-- LOGO -->
          <a href="#" class="-mt-1 -ml-5 text-lg font-semibold rounded-lg">
            <img src="/frontend/assets/images/logo.png" class="-mb-3 lg:-mb-3.5 h-[70px] md:h-[75px] lg:h-[80px]" alt="logo" />
          </a>
          <!-- END LOGO -->

          <!-- CONNECT BUTTON -->
          <div class="right-0 -mt-1 text-lg font-semibold rounded-lg btn__connect_wallet lg:absolute">
            <img class="play-now-animation h-[35px] md:h-[40px] lg:h-[45px]" src="/frontend/assets/images/play-now.png" alt="Play now" />
          </div>
          <!-- END CONNECT BUTTON -->

          <!-- WALLET DETAIL -->
          <div style="display: none" class="right-0 -mt-1 text-lg font-semibold rounded-lg wallet-detail lg:absolute">
            <div class="relative">
              <img class="h-[35px] md:h-[40px] lg:h-[45px]" src="/frontend/assets/images/icons/button-frame.png" alt="Play now" />
              <div class="absolute -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2 text-[14px] font-normal leading-5 text-center">
                <span class="block text-slate-200 address"></span>
                <div class="flex space-x-1 text-[12px] font-normal leading-4 justify-center">
                  <span>Balance:</span>
                  <span class="balance"></span>
                </div>
              </div>
            </div>
          </div>
          <!-- END WALLET DETAIL -->

          <button class="rounded-lg lg:hidden focus:outline-none focus:shadow-outline" @click="open = !open">
            <svg fill="currentColor" viewBox="0 0 20 20" class="w-6 h-6">
              <path
                x-show="!open"
                fill-rule="evenodd"
                d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM9 15a1 1 0 011-1h6a1 1 0 110 2h-6a1 1 0 01-1-1z"
                clip-rule="evenodd"></path>
              <path
                x-show="open"
                fill-rule="evenodd"
                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                clip-rule="evenodd"></path>
            </svg>
          </button>
        </div>
        <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 lg:pb-0 lg:flex lg:flex-row">
          <a class="px-3 py-2 uppercase hover:text-[#fcba3b]" href="#about">Video</a>
          <a class="px-3 py-2 uppercase hover:text-[#fcba3b]" href="#hero">Hero</a>
          <a class="px-3 py-2 uppercase hover:text-[#fcba3b]" href="#game-feature">Game Feature</a>
          <a class="px-3 py-2 uppercase hover:text-[#fcba3b]" href="#roadmap">Roadmap</a>
          <a class="px-3 py-2 uppercase hover:text-[#fcba3b]" href="#our-team">Our team</a>
          <div @click.away="open = false" class="relative" x-data="{ open: false }">
            <button
              @click="open = !open"
              class="flex bg-transparent flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left hover:text-[#fcba3b] rounded-lg lg:w-auto lg:inline lg:mt-0 lg:ml-4">
              <span>Docs</span>
              <svg
                fill="currentColor"
                viewBox="0 0 20 20"
                :class="{'rotate-180': open, 'rotate-0': !open}"
                class="inline w-4 h-4 mt-1 ml-1 transition-transform duration-200 transform lg:-mt-1">
                <path
                  fill-rule="evenodd"
                  d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                  clip-rule="evenodd"></path>
              </svg>
            </button>
            <div
              x-show="open"
              x-transition:enter="transition ease-out duration-100"
              x-transition:enter-start="transform opacity-0 scale-95"
              x-transition:enter-end="transform opacity-100 scale-100"
              x-transition:leave="transition ease-in duration-75"
              x-transition:leave-start="transform opacity-100 scale-100"
              x-transition:leave-end="transform opacity-0 scale-95"
              class="absolute right-0 w-full origin-top-right lg:w-auto">
              <div class="bg-[#181728] rounded-md shadow-lg divide-y divide-[#ffffff] divide-opacity-10">
                <a class="block px-6 py-3 font-semibold hover:text-[#fcba3b] whitespace-nowrap" target="_blank" href="https://whitepaper.deathhunter.io/">
                  White Paper
                </a>
                <a class="block px-6 py-3 font-semibold hover:text-[#fcba3b] whitespace-nowrap" href="#">Pitch Deck</a>
              </div>
            </div>
          </div>
        </nav>
      </div>
    </div>

    <!-- End Nav -->
    <div class="h-[62px] lg:hidden"></div>

    <section id="video" class="section-video z-[1]">
      <video muted playsinline autoplay loop style="height: 100%; width: 100%">
        <source src="/frontend/assets/videos/background-new.webm" type="video/webm" />
        <source src="/frontend/assets/videos/background-new.mp4" type="video/mp4" />
        Your browser does not support the video tag.
      </video>
    </section>

    <div class="particle-1 z-[0]"></div>

    <section id="about" class="section-about">
      <div class="container text-center pt-[60px]">
        <h2 class="title-gold">THE BEST IDLE RPG Game on blockchain</h2>
        <p class="max-w-screen-lg mx-auto mt-10 font-bold text-[13px] md:text-[14px] lg:text-[16px]">
          Death Hunter is a mobile aRPG Game in which players can earn token through PvP/ PvE battles between Heroes.
        </p>
        <p class="mx-auto font-bold text-[13px] md:text-[14px] lg:text-[16px]">
          Each Hero is unique and equally accessible to anyone. There is no inital investment barrier in Death Hunter.
        </p>
        <div class="relative aspect-[1378/876] w-full">
          <div class="absolute -translate-y-1/2 top-1/2">
            <video id="game-story" class="w-[78%] ml-[11%]" preload="metadata" playsinline>
              <source src="/frontend/assets/videos/game-story.webm#t=0.4" type="video/webm" />
              <source src="/frontend/assets/videos/game-story.mp4#t=0.4" type="video/mp4" />
            </video>
            <div id="video-control" class="absolute -translate-x-1/2 -translate-y-1/2 cursor-pointer top-1/2 left-1/2">
              <div class="relative">
                <div class="w-16 h-16 lg:w-28 lg:h-28 animate-[ping_2s_linear_infinite] bg-[#FCBA3B] rounded-full"></div>
                <img
                  src="/frontend/assets/images/icons/play-video.png"
                  class="absolute w-16 h-16 -translate-x-1/2 -translate-y-1/2 cursor-pointer top-1/2 left-1/2 lg:w-28 lg:h-28" />
              </div>
            </div>
          </div>
          <div class="absolute inset-0 pointer-events-none select-none">
            <img src="/frontend/assets/images/video-frame.png" class="absolute bottom-0 w-full" />
          </div>
          <div class="absolute inset-0 bottom-[6%] select-none pointer-events-none">
            <img
              class="absolute bottom-0 left-[-8%] w-[80px] sm:w-[100px] md:w-[150px] lg:w-[250px] xl:w-[400px]"
              src="/frontend/assets/images/animations/adonis-idle-new-min.gif" />
            <img
              class="absolute bottom-0 right-[-6%] scale-x-[-1] w-[90px] sm:w-[120px] md:w-[180px] lg:w-[300px] xl:w-[480px]"
              src="/frontend/assets/images/animations/ducan-idle-new-min.gif" />
          </div>
        </div>
      </div>
    </section>

    <div class="particle-2"></div>

    <section id="value" class="section-value">
      <div class="container py-[40px] lg:py-[80px]">
        <h2 class="title-gold">Value proposition</h2>
        <div class="grid grid-col-1 lg:grid-cols-3 gap-20 md:gap-24 lg:gap-28 xl:gap-28 2xl:gap-40 mt-[140px] lg:mt-[180px]">
          <div
            data-aos="fade-right"
            data-aos-duration="750"
            class="relative flex flex-col justify-end text-center game-feature-image rounded-[50px] aspect-[460/318] py-3 px-2 lg:px-5 lg:py-6">
            <h4>Play & EARN</h4>
            <p class="text-[#D1D3D4] text-[14px] md:text-[15px] lg:text-[16px] font-['Roboto'] font-bold">
              Unlike most NFT games that only focus on Earning, Death Hunter focuses more on the player's experience on and off the game by creating a
              Play-and-Earn balance
            </p>
            <img class="absolute -translate-x-1/2 left-1/2 top-[-40%] w-[160px] lg:w-[200px]" src="/frontend/assets/images/icons/shield.png" alt="hammer" />
          </div>
          <div
            data-aos="fade-up"
            data-aos-duration="750"
            data-aos-delay="300"
            class="relative flex flex-col justify-end text-center game-feature-image rounded-[50px] aspect-[460/318] py-3 px-2 lg:px-5 lg:py-6">
            <h4>DEFI FEATURE</h4>
            <p class="text-[#D1D3D4] text-[14px] md:text-[15px] lg:text-[16px] font-['Roboto'] font-bold">
              Player can earn token and NFT hero by staking NFT hero and NFT box
            </p>
            <img class="absolute -translate-x-1/2 left-1/2 top-[-30%] w-[180px] lg:w-[220px]" src="/frontend/assets/images/icons/hammer.png" alt="hammer" />
          </div>
          <div
            data-aos="fade-left"
            data-aos-delay="600"
            data-aos-duration="750"
            class="relative flex flex-col justify-end text-center game-feature-image rounded-[50px] aspect-[460/318] py-3 px-2 lg:px-5 lg:py-6">
            <h4>GAME ECONOMIC</h4>
            <p class="text-[#D1D3D4] text-[14px] md:text-[15px] lg:text-[16px] font-['Roboto'] font-bold">
              Two types of Token: pre-minted token and unlimited token
            </p>
            <img class="absolute -translate-x-1/2 left-1/2 top-[-20%] w-[180px] lg:w-[220px]" src="/frontend/assets/images/icons/trophy.png" alt="hammer" />
          </div>
        </div>
      </div>
    </section>

    <div class="particle-3"></div>

    <section id="hero" class="section-hero">
      <div class="container py-[50px] lg:py-[87px]">
        <h2 class="text-center">NFT Hero</h2>
        <p class="text-center font-['SF Pro'] font-bold text-[18px] lg:text-[22px]">Earn your NFT items and trade them on the marketplace to make money</p>
        <div class="grid grid-cols-10 mt-10">
          <div class="col-span-5 lg:col-span-3">
            <div class="hero-avatar active" data-hero="ducan">
              <img src="/frontend/assets/images/heroes/avatar-ducan.png?v=1" alt="ducan" />
              <img src="/frontend/assets/images/heroes/avatar-ducan-active.png?v=1" alt="ducan" />
            </div>
            <div class="hero-avatar" data-hero="adonis">
              <img src="/frontend/assets/images/heroes/avatar-adonis.png?v=1" alt="adonis" />
              <img src="/frontend/assets/images/heroes/avatar-adonis-active.png?v=1" alt="adonis" />
            </div>
            <div class="hero-avatar" data-hero="joyce">
              <img src="/frontend/assets/images/heroes/avatar-joyce.png?v=1" alt="joyce" />
              <img src="/frontend/assets/images/heroes/avatar-joyce-active.png?v=1" alt="joyce" />
            </div>
            <div class="hero-avatar" data-hero="selina">
              <img src="/frontend/assets/images/heroes/avatar-selina.png?v=1" alt="selina" />
              <img src="/frontend/assets/images/heroes/avatar-selina-active.png?v=1" alt="selina" />
            </div>
            <div class="hero-avatar" data-hero="sunhee">
              <img src="/frontend/assets/images/heroes/avatar-sunhee.png?v=1" alt="sunhee" />
              <img src="/frontend/assets/images/heroes/avatar-sunhee-active.png?v=1" alt="sunhee" />
            </div>
            <div class="hero-avatar" data-hero="thienbao">
              <img src="/frontend/assets/images/heroes/avatar-thienbao.png?v=1" alt="thienbao" />
              <img src="/frontend/assets/images/heroes/avatar-thienbao-active.png?v=1" alt="thienbao" />
            </div>
          </div>
          <div class="flex items-center justify-center col-span-5 lg:col-span-4">
            <img id="hero-idle" class="" src="/frontend/assets/images/animations/ducan-idle-new-min.gif" alt="Adonis" />
          </div>
          <div class="items-center hidden col-span-10 lg:col-span-3 lg:flex">
            <div class="hero-info bg-[#1A172B] space-y-3 p-6 lg:p-10 lg:space-y-5 rounded-[20px]">
              <h3 id="hero-name">DUCAN</h3>
              <p id="hero-description" class="mt-4 text-[14px] lg:text-[16px]">
                Duncan has the special ability of his gauntlet that can generate super-high voltage electric currents, creating fire that melts metal. Duncan
                also apparates to go underground. He can even live without air for hours. Duncan's skin is very hard against metal, but is easily damaged by
                water.
              </p>
              <div class="space-y-2 lg:space-y-5">
                <div class="flex items-center">
                  <div class="w-[120px] font-['Roboto'] text-[14px] lg:text-[16px]">Strength:</div>
                  <div class="w-full bg-gray-200 rounded-full h-[4.33px] overflow-hidden">
                    <div id="hero-strength" class="bg-[#FCBA3B] h-[4.33px] rounded-full transition-all duration-500 ease-in-out" style="width: 70%"></div>
                  </div>
                </div>
                <div class="flex items-center">
                  <div class="w-[120px] font-['Roboto'] text-[14px] lg:text-[16px]">Agility:</div>
                  <div class="w-full bg-gray-200 rounded-full h-[4.33px] overflow-hidden">
                    <div id="hero-agility" class="bg-[#6A4FFF] h-[4.33px] rounded-full transition-all duration-500 ease-in-out" style="width: 30%"></div>
                  </div>
                </div>
                <div class="flex items-center">
                  <div class="w-[120px] font-['Roboto'] text-[14px] lg:text-[16px]">Defense:</div>
                  <div class="w-full bg-gray-200 rounded-full h-[4.33px] overflow-hidden">
                    <div id="hero-defense" class="bg-[#0029FF] h-[4.33px] rounded-full transition-all duration-500 ease-in-out" style="width: 60%"></div>
                  </div>
                </div>
                <div class="flex items-center">
                  <div class="w-[120px] font-['Roboto'] text-[14px] lg:text-[16px]">Health:</div>
                  <div class="w-full bg-gray-200 rounded-full h-[4.33px] overflow-hidden">
                    <div id="hero-health" class="bg-[#18FD58] h-[4.33px] rounded-full transition-all duration-500 ease-in-out" style="width: 84%"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <div class="particle-4"></div>

    <section id="game-feature" class="section-game-feature">
      <div class="container py-[23px]">
        <h2 class="text-center title-line">Game features</h2>
        <div class="grid gap-8 mt-10 xl:gap-20 lg:grid-cols-2">
          <img class="order-2 game-feature-image lg:order-1" src="/frontend/assets/images/asemble-your-squad.jpeg" />
          <div class="flex flex-col justify-center order-1 lg:order-2">
            <h3 class="title-line-full">Asemble your squad</h3>
            <p class="mt-4 font-bold text-[18px] lg:text-[22px]">
              Different characters with exclusive skills, make a reasonable team through characters matching.
            </p>
          </div>
        </div>
        <div class="grid gap-8 mt-10 xl:gap-20 lg:grid-cols-2">
          <div class="flex flex-col justify-center">
            <h3 class="title-line-full">Powered your heroes</h3>
            <p class="mt-4 font-bold text-[18px] lg:text-[22px]">Upgrade hero levels and evolve to strengthen your squad.</p>
          </div>
          <img class="game-feature-image" src="/frontend/assets/images/powered-your-heroes.jpeg" />
        </div>
        <div class="grid gap-8 mt-10 xl:gap-20 lg:grid-cols-2">
          <img class="order-2 game-feature-image lg:order-1" src="/frontend/assets/images/game-story-pve.jpeg" />
          <div class="flex flex-col justify-center order-1 lg:order-2">
            <h3 class="title-line-full">Game story - pve</h3>
            <p class="mt-4 font-bold text-[18px] lg:text-[22px]">Fight in story mode and get bonus tokens even when you're offline.</p>
          </div>
        </div>
        <div class="grid gap-8 mt-10 xl:gap-20 lg:grid-cols-2">
          <div class="flex flex-col justify-center">
            <h3 class="title-line-full">PVP arena</h3>
            <p class="mt-4 font-bold text-[18px] lg:text-[22px]">Fight with other players and get rewarded with $DHT tokens, champions and gift boxes.</p>
          </div>
          <img class="game-feature-image" src="/frontend/assets/images/pvp-arena.png" />
        </div>
      </div>
    </section>

    <div class="particle-1"></div>

    <section id="pte" class="section-pte">
      <div class="container py-[80px] lg:py-[122px]">
        <h2 class="z-10 pb-10 text-center title-line lg:p-0">Play to earn</h2>
        <div class="flex flex-col items-center justify-between lg:flex-row">
          <div class="z-10 lg:w-[40%] rounded-[15px] bg-[#000000] bg-opacity-25 backdrop-blur-[15px] lg:space-y-2">
            <div class="flex items-center">
              <div class="px-6 py-4">
                <img src="/frontend/assets/images/icons/gem-blue.png" class="w-[80px] sm:w-[100px] md:w-[120px]" alt="gem" />
              </div>
              <div class="w-full space-y-1 md:space-y-2 lg:space-y-3">
                <div class="text-[#FCBA3B] text-[22px]">Trading</div>
                <p class="text-[13px] md:text-[14px] lg:text-[16px]">Players can sell Heroes and valuable items at the Marketplace.</p>
              </div>
            </div>
            <div class="flex items-center">
              <div class="px-6 py-4">
                <img src="/frontend/assets/images/icons/gem-green.png" class="w-[80px] sm:w-[100px] md:w-[120px]" alt="gem" />
              </div>
              <div class="w-full space-y-1 md:space-y-2 lg:space-y-3">
                <div class="text-[#FCBA3B] text-[22px]">Renting</div>
                <p class="text-[13px] md:text-[14px] lg:text-[16px]">
                  Players can rent out their hero for profit. The rental price will depend on the hero's value in the market.
                </p>
              </div>
            </div>
            <div class="flex items-center">
              <div class="px-6 py-4">
                <img src="/frontend/assets/images/icons/gem-purple.png" class="w-[80px] sm:w-[100px] md:w-[120px]" alt="gem" />
              </div>
              <div class="w-full space-y-1 md:space-y-2 lg:space-y-3">
                <div class="text-[#FCBA3B] text-[22px]">Gacha</div>
                <p class="text-[13px] md:text-[14px] lg:text-[16px]">
                  Lucky spin function, players will be profitable if they are lucky enough to open valuable rare heroes.
                </p>
              </div>
            </div>
            <div class="flex items-center">
              <div class="px-6 py-4">
                <img src="/frontend/assets/images/icons/gem-purple.png" class="w-[80px] sm:w-[100px] md:w-[120px]" alt="gem" />
              </div>
              <div class="w-full space-y-1 md:space-y-2 lg:space-y-3">
                <div class="text-[#FCBA3B] text-[22px]">Reward</div>
                <p class="text-[13px] md:text-[14px] lg:text-[16px]">Player can earn token via quest, pvp, tower conquest, clan event.</p>
              </div>
            </div>
          </div>
          <div class="relative mt-8 lg:mt-0 lg:w-[54%]">
            <div class="scale-[1.1] -z-10">
              <img src="/frontend/assets/images/magic-circle.png" class="w-full h-full animate-[spin_30s_linear_infinite]" />
            </div>
            <div class="absolute w-[90%] -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2">
              <img src="/frontend/assets/images/treasure.png" class="" />
            </div>
          </div>
        </div>
      </div>
    </section>

    <div class="particle-2"></div>

    <section id="roadmap" class="section-roadmap lg:block">
      <div class="container pt-[60px]">
        <div class="roadmap">
          <div class="pb-16">
            <h2 class="text-center title-line">Roadmap</h2>
          </div>
          <div class="roadmap-content w-full xl:w-[520px] absolute left-1/2 -translate-x-1/2">
            <ul>
              <div>2023 and Later</div>
              <li>- Death Hunter Metaverse</li>
              <li>- Land System</li>
              <li>- Governace</li>
              <li>- VR/AA Game Mode</li>
            </ul>
            <ul>
              <div>Q4/2022 -</div>
              <li>Hero's Equipment System -</li>
              <li>Treasure Hunting -</li>
              <li>World Boss Raid -</li>
              <li>PC Version -</li>
              <li>Clan War -</li>
            </ul>
            <ul>
              <div>Q3/2022</div>
              <li>- Mainet Launch</li>
              <li>- PVE - Full Mode</li>
              <li>- PVE - Simple ModE</li>
              <li>- Hero Fusion</li>
              <li>- PVP Tournament</li>
              <li>- Tower Conquest</li>
            </ul>
            <ul>
              <div>Q2/2022 -</div>
              <li>Ido -</li>
              <li>Testnet Launch -</li>
              <li>PVE - Simple Mode -</li>
              <li>PVP Mode -</li>
              <li>Audit Smartcontract -</li>
            </ul>
            <ul>
              <div>Q1/2022</div>
              <li>- Market Place</li>
              <li>- Heroes Nft Sale</li>
              <li>- NFT</li>
              <li>- Prototype For The Game ReleasE</li>
              <li>- Private Sale</li>
            </ul>
            <ul>
              <div>Q4/2021</div>
              <li>Game Design Document Release ???</li>
              <li>Whitepaper & Pitchdesk Release ???</li>
              <li>The Landing Page ???</li>
              <li>Seed Sale ???</li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <div class="particle-3"></div>

    <section id="our-team" class="section-our-team">
      <div class="container pt-[70px] lg:pt-[108px]">
        <h2 class="text-center">Our Team</h2>
        <div class="grid max-w-screen-lg grid-cols-4 gap-2 pt-6 mx-auto lg:-pt-12 md:gap-4 lg:gap-6">
          <div>
            <img src="/frontend/assets/images/teams/allian-mark.png" alt="Allian Mark" />
            <div class="text-center text-[16px] md:text-[20px] lg:text-[24px] font-bold font-['Roboto']">ALLIAN MARK</div>
            <div class="text-center text-[12px] lg:text-[16px] font-bold font-['Roboto']">Founder - CEO</div>
          </div>
          <div>
            <img src="/frontend/assets/images/teams/praveen-khichar.png" alt="Praveen Khichar" />
            <div class="text-center text-[16px] md:text-[20px] lg:text-[24px] font-bold font-['Roboto']">PRAVEEN KHICHAR</div>
            <div class="text-center text-[12px] lg:text-[16px] font-bold font-['Roboto']">CMO</div>
          </div>
          <div>
            <img src="/frontend/assets/images/teams/kevin-le.png" alt="Kevin Le" />
            <div class="text-center text-[16px] md:text-[20px] lg:text-[24px] font-bold font-['Roboto']">KEVIN LE</div>
            <div class="text-center text-[12px] lg:text-[16px] font-bold font-['Roboto']">Head of Blockchain</div>
          </div>
          <div>
            <img src="/frontend/assets/images/teams/dat-nguyen.png" alt="DAT NGUYEN" />
            <div class="text-center text-[16px] md:text-[20px] lg:text-[24px] font-bold font-['Roboto']">DAT NGUYEN</div>
            <div class="text-center text-[12px] lg:text-[16px] font-bold font-['Roboto']">Head of Game</div>
          </div>
        </div>
      </div>
    </section>

    <div class="particle-4"></div>

    <section id="partner" class="section-partner bg-[#171717]">
      <div class="container pt-[50px] lg:pt-[80px]">
        <h2 class="text-center">Partner</h2>
        <p class="text-center">Our Partners & Investors</p>
        <div class="grid grid-cols-3 gap-6 pt-10 lg:pt-20 lg:grid-cols-5">
          <img src="/frontend/assets/images/partners/1.jpg" alt="Partner" />
          <img src="/frontend/assets/images/partners/2.jpg" alt="Partner" />
          <img src="/frontend/assets/images/partners/3.jpg" alt="Partner" />
          <img src="/frontend/assets/images/partners/4.jpg" alt="Partner" />
          <img src="/frontend/assets/images/partners/5.jpg" alt="Partner" />
        </div>
      </div>
    </section>
    <footer class="bg-[#000000]">
      <div class="container py-[100px]">
        <div class="grid grid-cols-2 lg:grid-cols-5">
          <div>
            <img src="/frontend/assets/images/logo.png" alt="Logo" />
            <div>SUBCRIBE US</div>
          </div>
          <div>
            <div>DEATH HUNTER</div>
            <ul>
              <li>
                <a href="#">HOME</a>
              </li>
              <li>
                <a href="#">MARKETPLACE</a>
              </li>
              <li>
                <a href="#">GAMEPLAY</a>
              </li>
            </ul>
          </div>
          <div>
            <div>DEATH HUNTER</div>
            <ul>
              <li>
                <a href="#">HOME</a>
              </li>
              <li>
                <a href="#">MARKETPLACE</a>
              </li>
              <li>
                <a href="#">GAMEPLAY</a>
              </li>
            </ul>
          </div>
          <div>
            <div>DEATH HUNTER</div>
            <ul>
              <li>
                <a href="#">HOME</a>
              </li>
              <li>
                <a href="#">MARKETPLACE</a>
              </li>
              <li>
                <a href="#">GAMEPLAY</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
  </body>
  <script
    src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"></script>
  <script src="/frontend/assets/js/landing.js?v=0.1.0"></script>
  <script src="/frontend/assets/js/narbar.js?v=0.1.0"></script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />

  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/web3@1.5.2/dist/web3.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/web3modal@1.9.4/dist/index.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@mintgate/evm-chains@0.3.16/dist/umd/index.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@walletconnect/web3-provider@1.6.5/dist/umd/index.min.js"></script>
  <script type="text/javascript" src="/frontend/custom/plugins/web3/app.js?v={{ time() }}"></script>
</html>
