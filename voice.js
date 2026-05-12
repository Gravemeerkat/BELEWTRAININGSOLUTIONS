function speak(text) {
    const msg = new SpeechSynthesisUtterance(text);
    msg.lang = "en-US";
    window.speechSynthesis.speak(msg);
}

function startVoiceCoach() {
    speak("Voice coach activated. Begin your maneuver.");
}