/**
 * Admin Login Client-Side Protection
 */
document.addEventListener('DOMContentLoaded', function () {
    const adminForm = document.getElementById('form1');

    if (adminForm) {
        adminForm.addEventListener('submit', function () {
            const btn = document.querySelector('.btn-admin');
            btn.value = "Authenticating...";
            btn.style.opacity = "0.7";
        });
    }
});