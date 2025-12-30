function togglePassword() {
    const passInput = document.getElementById('txtPassword');
    const toggleBtn = document.querySelector('.toggle-pass');

    if (passInput.type === "password") {
        passInput.type = "text";
        toggleBtn.textContent = "HIDE";
    } else {
        passInput.type = "password";
        toggleBtn.textContent = "SHOW";
    }
}