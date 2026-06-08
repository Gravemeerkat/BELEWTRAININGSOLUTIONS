import 'package:flutter/material.dart';

class AlleyDockScreen extends StatefulWidget {
  @override
  _AlleyDockScreenState createState() => _AlleyDockScreenState();
}

class _AlleyDockScreenState extends State<AlleyDockScreen> {
  int _currentStep = 0;

  final List<String> steps = [
    "Approach the alley at a 90-degree angle.",
    "Position truck so trailer is perpendicular to alley.",
    "Begin backing slowly into the alley.",
    "Use mirrors and spot checks frequently.",
    "Complete the dock by backing straight into the alley.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alley Dock",
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
                Icons.image_not_supported,
                size: 60,
                color: Colors.grey.shade400,
              ),
            ),
          ),
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
                              ? Colors.redAccent
                              : Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Step ${_currentStep + 1}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade700,
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
                                  "90-degree alley docking requires precision. "
                                  "Make frequent stops to check your position.",
                                ),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(color: Colors.redAccent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            "AI Guide",
                            style: TextStyle(
                              color: Colors.redAccent,
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
                            backgroundColor: Colors.redAccent,
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
