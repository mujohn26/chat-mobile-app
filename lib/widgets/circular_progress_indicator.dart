import 'package:flutter/material.dart';

class CenteredProgressIndicator extends StatelessWidget {
  const CenteredProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        key: Key("Progress-Indicator"),
        child: CircularProgressIndicator(
          color: Color(0xff21c0c5),
        ));
  }
}
