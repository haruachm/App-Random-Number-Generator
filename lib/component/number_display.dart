import 'package:flutter/material.dart';

class NumberDisplay extends StatelessWidget {
  final int maxNum;
  const NumberDisplay({required this.maxNum, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: maxNum
          .toInt()
          .toString()
          .split('')
          .map(
            (x) => Image.asset(
              'asset/img/$x.png',
              width: 50.0,
              height: 80.0,
            ),
          )
          .toList(),
    );
  }
}
