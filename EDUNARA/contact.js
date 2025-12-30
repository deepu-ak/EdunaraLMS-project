function validateContactForm() {
    const name = document.getElementById('txtName').value.trim();
    const email = document.getElementById('txtEmail').value.trim();
    const message = document.getElementById('txtMessage').value.trim();
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (name.length < 2) {
        alert("Please enter your full name.");
        return false;
    }

    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    if (message.length < 10) {
        alert("Your message must be at least 10 characters long.");
        return false;
    }

    return true;
}