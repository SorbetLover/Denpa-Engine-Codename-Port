import funkin.backend.utils.WindowUtils;

function new() {
    WindowUtils.winTitle = "YOUR FUNNY TITLE HERE";
}

function destroy() {
    WindowUtils.resetTitle();
}