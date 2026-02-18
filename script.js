// Smooth scroll for nav links
document.querySelectorAll('header nav a').forEach(link => {
  link.addEventListener('click', e => {
    e.preventDefault();
    const targetId = link.getAttribute('href').slice(1);
    const target = document.getElementById(targetId);
    if (target) {
      window.scrollTo({
        top: target.offsetTop - 60,
        behavior: 'smooth'
      });
    }
  });
});

// Simple fake submit handler for contact form
function handleSubmit(event) {
  event.preventDefault();
  const status = document.getElementById('form-status');
  status.textContent = 'Thank you! Your message has been recorded.';
  event.target.reset();
}
