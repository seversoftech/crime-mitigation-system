import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 25,
      height: 25,
      child: CircularProgressIndicator(
        strokeWidth: 5,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
