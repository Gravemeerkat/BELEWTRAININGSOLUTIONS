import 'package:flutter/material.dart';
import '../widgets/module_button.dart';
import 'straight_line_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Backing Trainer Pro",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              "Training Modules",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 25),

            // Module Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  ModuleButton(
                    title: "Straight Line",
                    icon: Icons.straight,
                    color: Colors.blue.shade400,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => StraightLineScreen()),
                      );
                    },
                  ),
                  ModuleButton(
                    title: "Offset Left",
                    icon: Icons.turn_left,
                    color: Colors.orange.shade400,
                    onTap: () {},
                  ),
                  ModuleButton(
                    title: "Offset Right",
                    icon: Icons.turn_right,
                    color: Colors.green.shade400,
                    onTap: () {},
                  ),
                  ModuleButton(
                    title: "Parallel",
                    icon: Icons.align_horizontal_center,
                    color: Colors.purple.shade400,
                    onTap: () {},
                  ),
                  ModuleButton(
                    title: "Alley Dock",
                    icon: Icons.local_shipping_outlined,
                    color: Colors.red.shade400,
                    onTap: () {},
                  ),
                  ModuleButton(
                    title: "General Backing",
                    icon: Icons.school_outlined,
                    color: Colors.teal.shade400,
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
