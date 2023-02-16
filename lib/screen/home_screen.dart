// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:app_random_number_generaotr/constant/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNum = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Row(
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.android_sharp,
                      color: green_color,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: randomNum
                      .asMap()
                      .entries
                      .map(
                        (x) => Padding(
                          padding: EdgeInsets.only(bottom: x.key == 3 ? 0 : 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: x.value
                                .toString()
                                .split('')
                                .map((x) => Image.asset(
                                      'asset/img/$x.png',
                                      width: 40,
                                      height: 60,
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: red_color,
                  ),
                  onPressed: () {
                    final random = Random();

                    final Set<int> newNum = {};
                    while (newNum.length != 5) {
                      final number = random.nextInt(1000000);
                      newNum.add(number);

                      setState(() {
                        randomNum = newNum.toList();
                      });
                    }
                  },
                  child: Text('랜덤숫자 생성'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
