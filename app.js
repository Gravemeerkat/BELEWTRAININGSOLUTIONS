screens.dashboard = () => `
    <div class="navbar">Backing Trainer Pro</div>
    <div class="screen">
        <div class="grid">
            <div class="card" onclick="navigate('straight')">Straight Line</div>
            <div class="card" onclick="navigate('offset')">Offset Back</div>
            <div class="card" onclick="navigate('parallel')">Parallel Parking</div>
            <div class="card" onclick="navigate('alley')">Alley Dock</div>
            <div class="card" onclick="navigate('voice')">Voice Coach</div>
            <div class="card" onclick="navigate('resources')">Resources</div>
        </div>
    </div>
`;

screens.straight = () => `
    <div class="navbar">Straight Line Backing</div>
    <div class="screen">
        <p>AI guide: Keep your trailer centered. Small corrections only.</p>
        <div class="diagram-box">[Straight-line diagram here]</div>
        <button onclick="navigate('dashboard')">Back</button>
    </div>
`;

screens.offset = () => `
    <div class="navbar">Offset Backing</div>
    <div class="screen">
        <p>Follow FMCSA exam-style offset path.</p>
        <div class="diagram-box">[Offset diagram]</div>
        <button onclick="navigate('dashboard')">Back</button>
    </div>
`;

screens.parallel = () => `
    <div class="navbar">Parallel Parking</div>
    <div class="screen">
        <p>Practice conventional & sight-side CDL parallel parking.</p>
        <div class="diagram-box">[Parallel diagram]</div>
        <button onclick="navigate('dashboard')">Back</button>
    </div>
`;

screens.alley = () => `
    <div class="navbar">Alley Dock</div>
    <div class="screen">
        <p>Simulate tight-space 90-degree alley dock backing.</p>
        <div class="diagram-box">[Alley dock diagram]</div>
        <button onclick="navigate('dashboard')">Back</button>
    </div>
`;

screens.voice = () => `
    <div class="navbar">AI Voice Coach</div>
    <div class="screen">
        <p>Press the button to start vocal guidance.</p>
        <button onclick="startVoiceCoach()">Start Voice Coach</button>
        <button onclick="navigate('dashboard')">Back</button>
    </div>
`;

screens.resources = () => `
    <div class="navbar">Resources</div>
    <div class="screen">
        <p>Add your YouTube links, training materials, and sponsors here.</p>
        <button onclick="navigate('dashboard')">Back</button>
    </div>
`;

navigate("dashboard");