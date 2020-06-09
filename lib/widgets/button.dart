import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  const Button({
    this.width,
    @required this.label,
    this.onPressed,
    this.color
  });

  final double width;
  final String label;
  final Function onPressed;
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width ?? double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
            color: color ?? Colors.blue,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Center(
            child: Text(
              label, style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}