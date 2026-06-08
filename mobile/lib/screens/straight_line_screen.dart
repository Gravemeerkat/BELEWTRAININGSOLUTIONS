import 'package:flutter/material.dart';
import '../services/voice_service.dart';

class StraightLineScreen extends StatefulWidget {
  @override
  _StraightLineScreenState createState() => _StraightLineScreenState();
}

class _StraightLineScreenState extends State<StraightLineScreen> {
  int _currentStep = 0;
  bool _isListening = false;
  late VoiceService _voiceService;

  final List<String> steps = [
    "Position the truck centered within the lane.",
    "Check mirrors to confirm trailer alignment.",
    "Begin backing slowly while holding the wheel steady.",
    "Make micro-corrections using mirrors only.",
    "Stop when trailer reaches the target cones.",
  ];

  final List<String> voiceInstructions = [
    "Step 1: Position the truck centered within the lane. Ensure your truck is straight before you start backing.",
    "Step 2: Check mirrors to confirm trailer alignment. Look at both side mirrors and your center mirror.",
    "Step 3: Begin backing slowly while holding the wheel steady. Never exceed 5 miles per hour.",
    "Step 4: Make micro-corrections using mirrors only. Use small steering inputs to keep the trailer straight.",
    "Step 5: Stop when trailer reaches the target cones. You have successfully completed straight line backing.",
  ];

  @override
  void initState() {
    super.initState();
    _voiceService = VoiceService();
  }

  @override
  void dispose() {
    _voiceService.dispose();
    super.dispose();
  }

  void _playVoiceInstruction() async {
    setState(() {
      _isListening = true;
    });
    await _voiceService.speak(voiceInstructions[_currentStep]);
    setState(() {
      _isListening = false;
    });
  }

  void _stopVoice() async {
    await _voiceService.stop();
    setState(() {
      _isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Straight Line Backing",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),

      body: Column(
        children: [
          // --- TRAINING ILLUSTRATION ---
          Container(
            height: 220,
            width: double.infinity,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFEFF3F7),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Icon(
                Icons.local_shipping,
                size: 100,
                color: Colors.blueAccent,
              ),
            ),
          ),

          // --- STEPS PANEL ---
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Step-by-Step Guide",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),

                  // --- PROGRESS DOTS ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      steps.length,
                      (i) => AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: _currentStep == i ? 14 : 10,
                        height: _currentStep == i ? 14 : 10,
                        decoration: BoxDecoration(
                          color: _currentStep == i
                              ? Colors.blueAccent
                              : Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  // --- CURRENT STEP TEXT ---
                  Text(
                    "Step ${_currentStep + 1}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey.shade700,
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(
                    steps[_currentStep],
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),

                  Spacer(),

                  // --- VOICE BUTTON ---
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 16),
                    child: ElevatedButton.icon(
                      onPressed: _isListening ? _stopVoice : _playVoiceInstruction,
                      icon: Icon(_isListening ? Icons.stop : Icons.volume_up),
                      label: Text(
                        _isListening ? "Stop Audio" : "Listen to Instructions",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: _isListening
                            ? Colors.red.shade400
                            : Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),

                  // --- BUTTONS ---
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: Text("AI Guide"),
                                content: Text(
                                  "This is where the AI voice/visual guidance will go. "
                                  "It can describe mirror corrections, path prediction, "
                                  "and real-world angle adjustments.",
                                ),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(color: Colors.blueAccent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            "AI Guide",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentStep < steps.length - 1) {
                              setState(() {
                                _currentStep++;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            _currentStep == steps.length - 1
                                ? "Finish"
                                : "Next",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
