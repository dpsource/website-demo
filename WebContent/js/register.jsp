<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="hr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Real Madrid - Registracija</title>
<link rel="stylesheet" href="css/style-common.css">
<style>
  .register-page {
    min-height: calc(100vh - 160px);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 40px 20px;
    background: linear-gradient(135deg, #001a3a 0%, #004797 100%);
  }
  .register-card {
    background: white;
    border-radius: 20px;
    padding: 40px;
    width: min(420px, 95vw);
    box-shadow: 0 20px 60px rgba(0,0,0,0.4);
    border-top: 5px solid #fcc000;
  }
  .register-card h2 {
    color: #004797;
    margin: 0 0 6px;
    font-size: 1.7em;
  }
  .register-card .subtitle {
    color: #888;
    font-size: 0.88em;
    margin-bottom: 26px;
  }
  .register-logo {
    text-align: center;
    margin-bottom: 20px;
  }
  .register-logo img { height: 70px; }
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
      <li class="login-only"><a href="#" onclick="openLoginModal();return false;">Login</a></li>
      <li class="login-only"><a href="#" onclick="openRegisterModal();return false;">Register</a></li>
      <li class="logged-only"><a href="logout">Logout</a></li>
    </ul>
    <div class="hamburger" id="hamburger"><span></span><span></span><span></span></div>
  </nav>
</header>

<div class="register-page">
  <div class="register-card">
    <div class="register-logo">
      <img src="https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/250px-Real_Madrid_CF.svg.png" alt="Real Madrid">
    </div>
    <h2>📝 Registracija</h2>
    <p class="subtitle">Kreiraj svoj nalog za Real Madrid fan portal</p>

    <form id="regForm" onsubmit="handleRegister(event)">
      <label style="font-weight:600;font-size:.9em;color:#333;">Username</label>
      <input class="form-field" type="text" id="regUser" name="username" placeholder="Unesite username" minlength="3" required>
      <p class="form-hint">Minimalno 3 znaka</p>

      <label style="font-weight:600;font-size:.9em;color:#333;">Password</label>
      <input class="form-field" type="password" id="regPass" name="password" placeholder="Unesite lozinku" minlength="4" required>
      <p class="form-hint">Minimalno 4 znaka</p>

      <button class="btn" type="submit" style="width:100%;margin-top:8px;">Registruj se</button>
      <div id="regMsg" class="message" style="text-align:center;"></div>
    </form>

    <p style="text-align:center;margin-top:20px;font-size:.88em;color:#666;">
      Već imaš nalog? <a href="index.html" style="color:#004797;font-weight:600;">Idi na prijavu</a>
    </p>
  </div>
</div>

<footer>
  <p>© 2026 Real Madrid Fan Projekt | Napravio: Dario Pavljasevic</p>
</footer>

<!-- Modali potrebni za common.js -->
<div id="loginModal" class="modal">
  <div class="modal-content modal-small">
    <span class="close" onclick="closeModal('loginModal')">&times;</span>
    <h2 class="modal-title">🔐 Login</h2>
    <form onsubmit="loginSubmit(event)">
      <input class="form-field" type="text" name="username" placeholder="Username" required>
      <input class="form-field" type="password" name="password" placeholder="Password" required>
      <button class="btn" type="submit" style="width:100%;margin-top:12px;">Prijavi se</button>
      <div id="loginMsg" class="message"></div>
    </form>
  </div>
</div>
<div id="registerModal" class="modal"></div>
<div id="playerModal" class="modal"><div class="modal-content"><span class="close" onclick="closeModal('playerModal')">&times;</span><div id="playerModalBody"></div></div></div>
<div id="trophyModal" class="modal"><div class="modal-content"><span class="close" onclick="closeModal('trophyModal')">&times;</span><div id="trophyModalBody"></div></div></div>

<script src="js/common.js"></script>
<script>
function handleRegister(ev) {
    ev.preventDefault();
    var username = document.getElementById('regUser').value.trim();
    var password = document.getElementById('regPass').value;

    if (username.length < 3) {
        showMsg('regMsg', '⚠️ Username mora imati najmanje 3 znaka.', false);
        return;
    }
    if (password.length < 4) {
        showMsg('regMsg', '⚠️ Password mora imati najmanje 4 znaka.', false);
        return;
    }

    var fd = new FormData();
    fd.append('username', username);
    fd.append('password', password);

    fetch('register', { method: 'POST', body: fd })
        .then(function(r) { return r.json(); })
        .then(function(d) {
            showMsg('regMsg', d.success ? '✅ ' + d.message : '❌ ' + d.message, d.success);
            if (d.success) {
                setTimeout(function() { window.location.href = 'index.html'; }, 1200);
            }
        }).catch(function() {
            showMsg('regMsg', '❌ Greška u komunikaciji sa serverom.', false);
        });
}
</script>
</body>
</html>
