// ignore_for_file: prefer_const_constructors
import 'package:app_random_number_generaotr/constant/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  children: [
                    1234,
                    5678,
                    9012,
                    3456,
                  ]
                      .asMap()
                      .entries
                      .map(
                        (x) => Padding(
                          padding: EdgeInsets.only(bottom: x.key == 1 ? 0 : 30),
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
                  onPressed: () {},
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
