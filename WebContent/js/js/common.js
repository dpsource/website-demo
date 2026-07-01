/* ============================================================
   REAL MADRID - common.js
   ============================================================ */

function qs(s)  { return document.querySelector(s); }
function qsa(s) { return document.querySelectorAll(s); }
function htmlEscape(s) {
    return String(s || '').replace(/[&<>"]/g, function(c) {
        return {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[c];
    });
}

/* ---------- MODAL FUNKCIJE ---------- */
function openModal(id)  { var m = document.getElementById(id); if (m) m.classList.add('show'); }
function closeModal(id) { var m = document.getElementById(id); if (m) m.classList.remove('show'); }
function closeAllModals() { qsa('.modal').forEach(function(m) { m.classList.remove('show'); }); }
function openLoginModal()    { openModal('loginModal'); }
function openRegisterModal() { openModal('registerModal'); }

/* ---------- HAMBURGER ---------- */
function initHamburger() {
    var h = document.getElementById('hamburger');
    var n = document.getElementById('nav-links');
    if (!h || !n) return;
    h.onclick = function() {
        h.classList.toggle('active');
        n.classList.toggle('active');
    };
    qsa('#nav-links a').forEach(function(a) {
        a.addEventListener('click', function() {
            h.classList.remove('active');
            n.classList.remove('active');
        });
    });
}

/* ---------- AUTH STATUS ---------- */
function loadAuth() {
    fetch('authStatus').then(function(r) { return r.json(); }).then(function(d) {
        qsa('.login-only').forEach(function(e) { e.style.display = d.logged ? 'none' : 'list-item'; });
        qsa('.logged-only').forEach(function(e) { e.style.display = d.logged ? 'list-item' : 'none'; });
        qsa('.admin-only').forEach(function(e) {
            e.style.display = (d.logged && String(d.role).toLowerCase() === 'admin') ? 'list-item' : 'none';
        });
        var u = document.getElementById('currentUser');
        if (u) u.innerHTML = d.logged ? '👤 <b>' + htmlEscape(d.user) + '</b> (' + htmlEscape(d.role) + ')' : '';
    }).catch(function() {});
}

/* ---------- PRIKAZ PORUKE ---------- */
function showMsg(id, text, isSuccess) {
    var el = document.getElementById(id);
    if (!el) return;
    el.textContent = text;
    el.className = 'message ' + (isSuccess ? 'success' : 'error');
}

/* ---------- LOGIN ---------- */
function loginSubmit(ev) {
    ev.preventDefault();
    var username = document.querySelector('#loginModal input[name="username"]').value;
    var password = document.querySelector('#loginModal input[name="password"]').value;
    var params = new URLSearchParams();
    params.append('username', username);
    params.append('password', password);
    fetch('login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: params.toString()
    }).then(function(r) { return r.json(); }).then(function(d) {
        showMsg('loginMsg', d.success ? '✅ Uspješna prijava!' : '❌ ' + d.message, d.success);
        if (d.success) { setTimeout(function() { location.href = 'index.html'; }, 600); }
    }).catch(function() {
        showMsg('loginMsg', '❌ Greška u komunikaciji sa serverom.', false);
    });
}

/* ---------- REGISTER ---------- */
function registerSubmit(ev) {
    ev.preventDefault();
    var usernameEl = document.querySelector('#registerModal input[name="username"]');
    var passwordEl = document.querySelector('#registerModal input[name="password"]');
    var username = usernameEl ? usernameEl.value.trim() : '';
    var password = passwordEl ? passwordEl.value : '';

    /* Validacija na frontendu */
    if (username.length < 3) {
        showMsg('registerMsg', '⚠️ Username mora imati najmanje 3 znaka.', false);
        return;
    }
    if (password.length < 4) {
        showMsg('registerMsg', '⚠️ Password mora imati najmanje 4 znaka.', false);
        return;
    }

    var formData = new FormData();
    formData.append('username', username);
    formData.append('password', password);

    fetch('register', { method: 'POST', body: formData })
        .then(function(r) { return r.json(); })
        .then(function(d) {
            showMsg('registerMsg', d.success ? '✅ ' + d.message : '❌ ' + d.message, d.success);
            if (d.success) {
                setTimeout(function() {
                    closeModal('registerModal');
                    openModal('loginModal');
                    showMsg('loginMsg', '✅ Registracija uspješna! Unesite podatke za prijavu.', true);
                }, 900);
            }
        }).catch(function() {
            showMsg('registerMsg', '❌ Greška u komunikaciji sa serverom.', false);
        });
}

/* ---------- IGRAČ POPUP ---------- */
function openPlayer(id) {
    fetch('playerStats?id=' + encodeURIComponent(id))
        .then(function(r) { return r.json(); })
        .then(function(p) {
            if (!p.success) { alert(p.message || 'Greška'); return; }
            document.getElementById('playerModalBody').innerHTML =
                '<div class="player-modal-grid">' +
                  '<div>' +
                    '<img src="' + htmlEscape(p.image) + '" alt="' + htmlEscape(p.name) + '">' +
                    '<p style="text-align:center;color:#888;margin:6px 0 0;font-size:.85em;">' + htmlEscape(p.position) + '</p>' +
                  '</div>' +
                  '<div>' +
                    '<h2 class="modal-title">#' + htmlEscape(p.number) + ' ' + htmlEscape(p.name) + '</h2>' +
                    '<div class="gold-divider" style="margin:8px 0 20px;"></div>' +
                    '<h4 style="color:#004797;margin:0 0 12px;">📊 Statistika sezone</h4>' +
                    '<div class="stats-grid">' +
                      '<div class="stat-box"><strong>' + p.matches + '</strong>Utakmice</div>' +
                      '<div class="stat-box"><strong>' + p.goals + '</strong>Golovi</div>' +
                      '<div class="stat-box"><strong>' + p.assists + '</strong>Asistencije</div>' +
                      '<div class="stat-box"><strong>' + p.yellow_cards + '</strong>🟨 Žuti</div>' +
                      '<div class="stat-box"><strong>' + p.red_cards + '</strong>🟥 Crveni</div>' +
                    '</div>' +
                  '</div>' +
                '</div>';
            openModal('playerModal');
        }).catch(function() {
            alert('Ne mogu učitati statistiku. Provjeri bazu i servlet.');
        });
}

/* ---------- TROFEJ POPUP ---------- */
function openTrophy(id) {
    fetch('trophy?id=' + encodeURIComponent(id))
        .then(function(r) { return r.json(); })
        .then(function(t) {
            if (!t.success) { alert(t.message || 'Greška'); return; }
            var seasons = htmlEscape(t.seasons).replace(/,/g, ', ');
            document.getElementById('trophyModalBody').innerHTML =
                '<h2 class="modal-title">🏆 ' + htmlEscape(t.name) + '</h2>' +
                '<div class="gold-divider" style="margin:8px 0 20px;"></div>' +
                '<p style="font-size:1.15em;"><b>Broj naslova:</b> <span style="color:#004797;font-size:1.3em;font-weight:700;">' + t.count + '</span></p>' +
                '<h4 style="color:#004797;">📅 Sezone/godine osvajanja</h4>' +
                '<div class="season-list">' + seasons + '</div>';
            openModal('trophyModal');
        }).catch(function() {
            alert('Ne mogu učitati trofej. Provjeri bazu i servlet.');
        });
}

/* ---------- INIT ---------- */
document.addEventListener('DOMContentLoaded', function() {
    initHamburger();
    loadAuth();
    qsa('.modal').forEach(function(m) {
        m.addEventListener('click', function(e) {
            if (e.target === m) m.classList.remove('show');
        });
    });
});
