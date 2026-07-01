<!DOCTYPE html>
<html lang="hr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Real Madrid - Stadion</title>
<link rel="stylesheet" href="css/style-common.css">
<style>
  .hero {
    background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Santiago_Bernab%C3%A9u_2022.jpg/1280px-Santiago_Bernab%C3%A9u_2022.jpg');
  }
  .stadium-facts {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin: 30px 0;
  }
  .fact-card {
    background: white;
    border-radius: 14px;
    padding: 24px 30px;
    text-align: center;
    box-shadow: 0 4px 16px rgba(0,71,151,0.14);
    min-width: 150px;
    flex: 1;
    max-width: 200px;
    border-bottom: 4px solid #fcc000;
  }
  .fact-num  { font-size: 2em; font-weight: 900; color: #004797; line-height: 1.1; }
  .fact-label{ font-size: 0.82em; color: #666; margin-top: 4px; }
  .stadium-gallery {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 20px;
    max-width: 1100px;
    margin: 30px auto;
    padding: 0 20px;
  }
  .stadium-gallery img {
    width: 100%;
    border-radius: 14px;
    box-shadow: 0 6px 20px rgba(0,71,151,0.18);
    transition: transform 0.3s;
    object-fit: cover;
    height: 220px;
  }
  .stadium-gallery img:hover { transform: scale(1.03); }
</style>
</head>
<body>

<header>
  <div class="logo">
    <img src="https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/250px-Real_Madrid_CF.svg.png" alt="Real Madrid Logo">
    <h1>Real Madrid CF</h1>
  </div>
  <nav>
    <ul id="nav-links">
      <li><a href="index.html">Početna</a></li>
      <li><a href="oklubu.html">O klubu</a></li>
      <li><a href="tim.html">Tim</a></li>
      <li><a href="trofeji.html">Trofeji</a></li>
      <li><a href="stadion.html">Stadion</a></li>
      <li class="admin-only"><a href="admin.html">Admin tabla</a></li>
      <li class="login-only"><a href="#" onclick="openLoginModal();return false;">Prijava</a></li>
      <li class="login-only"><a href="#" onclick="openRegisterModal();return false;">Registracija</a></li>
      <li class="logged-only"><a href="logout">Odjava</a></li>
    </ul>
    <div class="hamburger" id="hamburger"><span></span><span></span><span></span></div>
  </nav>
</header>

<section class="hero">
  <h2>Santiago Bernabéu</h2>
  <p>Dom Real Madrida od 1947. — jedan od najpoznatijih stadiona na svijetu</p>
</section>

<section class="section">
  <h2>O stadionu</h2>
  <div class="gold-divider"></div>

  <div class="stadium-facts">
    <div class="fact-card">
      <div class="fact-num">85.454</div>
      <div class="fact-label">Kapacitet</div>
    </div>
    <div class="fact-card">
      <div class="fact-num">1947</div>
      <div class="fact-label">Godina otvaranja</div>
    </div>
    <div class="fact-card">
      <div class="fact-num">2023</div>
      <div class="fact-label">Renovacija završena</div>
    </div>
    <div class="fact-card">
      <div class="fact-num">105×68</div>
      <div class="fact-label">Dimenzije terena (m)</div>
    </div>
  </div>

  <p style="max-width:750px;margin:0 auto 30px;line-height:1.9;color:#444;text-align:center;">
    Estadio Santiago Bernabéu jedan je od najprepoznatljivijih i najljepših football stadiona na svijetu.
    Smješten u srcu Madrida, rekonstruiran je u potpunosti između 2019. i 2023. godine — dobio je novi
    krov koji se može otvarati i zatvarati, suvremene fasade od titanija i potpuno moderniziranu unutrašnjost.
  </p>

  <div class="stadium-gallery">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Santiago_Bernab%C3%A9u_2022.jpg/1280px-Santiago_Bernab%C3%A9u_2022.jpg"
         alt="Santiago Bernabéu - vanjski izgled"
         onerror="this.src='https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Estadio_Santiago_Bernab%C3%A9u_-_Madrid_%28Spain%29_-_November_2022.jpg/1280px-Estadio_Santiago_Bernab%C3%A9u_-_Madrid_%28Spain%29_-_November_2022.jpg'">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Estadio_Santiago_Bernab%C3%A9u_Madrid.jpg/1280px-Estadio_Santiago_Bernab%C3%A9u_Madrid.jpg"
         alt="Santiago Bernabéu - unutrašnjost"
         onerror="this.src='https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Real_Madrid_vs_Atletico_Madrid_%28UEFA_Champions_League_Final%2C_2016%29.jpg/1280px-Real_Madrid_vs_Atletico_Madrid_%28UEFA_Champions_League_Final%2C_2016%29.jpg'">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Estadio_Santiago_Bernab%C3%A9u_-_01.jpg/1280px-Estadio_Santiago_Bernab%C3%A9u_-_01.jpg"
         alt="Santiago Bernabéu - tribine iz zraka"
         onerror="this.src='https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Santiago_Bernab%C3%A9u_2022.jpg/800px-Santiago_Bernab%C3%A9u_2022.jpg'">
  </div>
</section>

<footer>
  <p>© 2026 Real Madrid Fan Projekt | Napravio: Dario Pavljasevic</p>
</footer>

<!-- MODALI -->
<div id="loginModal" class="modal">
  <div class="modal-content modal-small">
    <span class="close" onclick="closeModal('loginModal')">&times;</span>
    <h2 class="modal-title">🔐 Prijava</h2>
    <form onsubmit="loginSubmit(event)">
      <input class="form-field" type="text" name="username" placeholder="Korisničko ime" required>
      <input class="form-field" type="password" name="password" placeholder="Lozinka" required>
      <button class="btn" type="submit" style="width:100%;margin-top:12px;">Prijavi se</button>
      <div id="loginMsg" class="message"></div>
    </form>
  </div>
</div>
<div id="registerModal" class="modal">
  <div class="modal-content modal-small">
    <span class="close" onclick="closeModal('registerModal')">&times;</span>
    <h2 class="modal-title">📝 Registracija</h2>
    <form onsubmit="registerSubmit(event)">
      <input class="form-field" type="text" name="username" placeholder="Korisničko ime" minlength="3" required>
      <p class="form-hint">Minimalno 3 znaka</p>
      <input class="form-field" type="password" name="password" placeholder="Lozinka" minlength="4" required>
      <p class="form-hint">Minimalno 4 znaka</p>
      <button class="btn" type="submit" style="width:100%;margin-top:12px;">Registruj se</button>
      <div id="registerMsg" class="message"></div>
    </form>
  </div>
</div>
<div id="playerModal" class="modal"><div class="modal-content"><span class="close" onclick="closeModal('playerModal')">&times;</span><div id="playerModalBody"></div></div></div>
<div id="trophyModal" class="modal"><div class="modal-content"><span class="close" onclick="closeModal('trophyModal')">&times;</span><div id="trophyModalBody"></div></div></div>

<script src="js/common.js"></script>
</body>
</html>