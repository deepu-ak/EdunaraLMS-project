document.addEventListener('DOMContentLoaded', function () {
    const searchBtn = document.getElementById('btnSearch');
    const searchInput = document.getElementById('txtSearch');

    if (searchBtn) {
        searchBtn.addEventListener('click', function () {
            if (searchInput.value.trim() !== "") {
                console.log("Searching for: " + searchInput.value);
                // Optional: Show a loading spinner
            }
        });
    }
});