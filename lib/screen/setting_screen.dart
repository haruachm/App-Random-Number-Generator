import 'package:app_random_number_generaotr/constant/color.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNum = 10000;
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
              _Body(maxNum: maxNum),
              _Footer(
                maxNum: maxNum,
                onSliderChanged: onSliderChanged,
                onButtonPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSliderChanged(double val) {
    //생성
    setState(() {
      maxNum = val;
    });
  }

  void onButtonPressed() {
    Navigator.of(context).pop(maxNum.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNum;
  const _Body({
    required this.maxNum,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
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
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNum; //외부로부터 변수 받아옴
  final ValueChanged<double>? onSliderChanged; //Silder onChanged 상태관리
  final VoidCallback onButtonPressed;

  const _Footer({
    required this.maxNum,
    required this.onSliderChanged,
    required this.onButtonPressed,
    Key? key,
  }) : super(key: key); //생성자 선언

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
            value: maxNum,
            min: 10000,
            max: 1000000,
            onChanged: onSliderChanged //변경
            ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: red_color),
            onPressed: onButtonPressed,
            child: Text('저장하기'),
          ),
        )
      ],
    );
  }
}
