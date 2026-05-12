import 'package:flutter/material.dart';

class ModuleButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function()? onTap;

  const ModuleButton({
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular icon background
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: color.withOpacity(.85),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 35,
              ),
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
}
