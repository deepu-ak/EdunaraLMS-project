function validateRegisterForm() {
    const name = document.getElementById('txtName').value.trim();
    const email = document.getElementById('txtEmail').value.trim();
    const pass = document.getElementById('txtPassword').value;
    const conf = document.getElementById('txtConfirm').value;
    const errorSpan = document.getElementById('matchError');

    // Reset error display
    errorSpan.style.display = "none";

    if (name === "" || email === "") {
        alert("Please fill in all required fields.");
        return false;
    }

    if (pass.length < 8) {
        alert("Password must be at least 8 characters long.");
        return false;
    }

    if (pass !== conf) {
        errorSpan.style.display = "block";
        return false;
    }

    return true;
}