import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton(
      {this.width,
      @required this.label,
      this.onPressed,
      this.color,
      this.loading});

  final double width;
  final String label;
  final Function onPressed;
  final Color color;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: loading ? null : onPressed,
        child: Container(
          width: width ?? double.infinity,
          height: 45.0,
          decoration: BoxDecoration(
              color: color ?? Colors.blue,
              borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: loading
                ? Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CupertinoActivityIndicator(),
                  )
                : Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
          ),
        ),
      ),
    );
  }
}
