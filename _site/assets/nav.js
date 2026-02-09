// nav.js – mobile menu and accessibility for PulsePaint
(function() {
  var navToggle = document.querySelector('.nav-toggle');
  var navLinks = document.querySelector('.nav-links') || document.querySelector('.main-nav');
  if (!navToggle || !navLinks) return;

  function closeMenu() {
    navLinks.classList.remove('open');
    navToggle.setAttribute('aria-expanded', 'false');
  }

  navToggle.addEventListener('click', function() {
    var expanded = navToggle.getAttribute('aria-expanded') === 'true';
    if (expanded) {
      closeMenu();
    } else {
      navLinks.classList.add('open');
      navToggle.setAttribute('aria-expanded', 'true');
      navLinks.querySelector('a').focus();
    }
  });

  navLinks.addEventListener('click', function(e) {
    if (e.target.tagName === 'A') {
      closeMenu();
    }
  });

  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      closeMenu();
      navToggle.focus();
    }
  });
})();
