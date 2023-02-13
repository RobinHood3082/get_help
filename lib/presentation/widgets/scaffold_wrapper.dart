import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatelessWidget {
  final Widget child;
  const ScaffoldWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
          begin: Alignment(-1.0, 0),
          end: Alignment(1.0, 0),
          colors: <Color>[
            Color(0xffabbaab),
            Color(0xffb7c4b7),
            Color(0xffc2cdc2),
            Color(0xffced7ce),
            Color(0xffdae1da),
            Color(0xffe6ebe6),
            Color(0xfff3f5f3),
            Color(0xffffffff),
          ],
        ),
      ),
      child: child,
    );
  }
}
