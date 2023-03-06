// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:app_random_number_generaotr/component/number_display.dart';
import 'package:app_random_number_generaotr/constant/color.dart';
import 'package:app_random_number_generaotr/screen/setting_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNum = 1000000;
  List<int> randomNum = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              _Hearder(
                onPressed: onSettingPop,
              ),
              _Body(randomNum: randomNum),
              _Footer(onPressed: onRandomNumberGenerator),
            ],
          ),
        ),
      ),
    );
  }

  void onSettingPop() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute(builder: (BuildContext context) {
        return SettingScreen(
          maxNum: maxNum,
        );
      }),
    );

    if (result != null) {
      setState(() {
        maxNum = result;
      });
    }
  }

  void onRandomNumberGenerator() {
    final random = Random();

    final Set<int> newNum = {};
    while (newNum.length != 5) {
      final number = random.nextInt(maxNum);
      newNum.add(number);

      setState(() {
        randomNum = newNum.toList();
      });
    }
  }
}

class _Hearder extends StatelessWidget {
  final VoidCallback onPressed;

  const _Hearder({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ' ⚡ NUMBER MAKER',
          style: TextStyle(
            color: white_color,
            fontSize: 25,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.android_sharp,
            color: green_color,
          ),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNum;

  const _Body({required this.randomNum, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNum
            .asMap()
            .entries
            .map(
              (x) => Padding(
                  padding: EdgeInsets.only(bottom: x.key == 3 ? 0 : 10),
                  child: NumberDisplay(
                    number: x.value.toInt(),
                  )),
            )
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _Footer({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: red_color,
        ),
        onPressed: onPressed,
        child: Text('랜덤숫자 생성'),
      ),
    );
  }
}
