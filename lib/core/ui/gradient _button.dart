import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key
    , required this.label
    
    , required this.gradient
    , required this.textColor
    , required this.onPressed
  });


  final Gradient gradient;
  final Color textColor;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: (label == 'GOLD' ? Colors.amber : Colors.grey).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}