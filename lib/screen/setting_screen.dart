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
              Expanded(
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
              ),
              Slider(
                value: maxNum,
                min: 10000,
                max: 1000000,
                onChanged: (double val) {
                  setState(() {
                    maxNum = val;
                  });
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: red_color),
                  onPressed: () {
                    Navigator.of(context).pop(maxNum.toInt());
                  },
                  child: Text('저장하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
