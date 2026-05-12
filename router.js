const screens = {};

function navigate(screenName) {
    const app = document.getElementById("app");
    app.innerHTML = screens[screenName]();
    window.scrollTo(0, 0);
}