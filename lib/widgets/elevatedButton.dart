import 'package:flutter/material.dart';

class ElevatedClickButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  ElevatedClickButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textTheme: ButtonTextTheme.primary,
      textColor: Colors.white,
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      splashColor: Colors.black12,
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
            constraints: const BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: child),
      ),
    );
  }
}
