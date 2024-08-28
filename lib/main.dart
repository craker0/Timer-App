// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TimeDown(),
    );
  }
}

class TimeDown extends StatefulWidget {
  const TimeDown({super.key});

  @override
  State<TimeDown> createState() => _TimeDownState();
}

class _TimeDownState extends State<TimeDown> {
  Timer? repeatedTimer;
  Duration duration = Duration(seconds: 0);
  bool isStoped = false;
  startTimer() {
    repeatedTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int sec = duration.inSeconds + 1;
        duration = Duration(seconds: sec);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 13, 32),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        duration.inHours.toString().padLeft(2, "0"),
                        style: TextStyle(color: Colors.black, fontSize: 77),
                      ),
                    ),
                    Text(
                      "Hours",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        duration.inMinutes
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: TextStyle(color: Colors.black, fontSize: 77),
                      ),
                    ),
                    Text(
                      "Minutes",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        duration.inSeconds
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: TextStyle(color: Colors.black, fontSize: 77),
                      ),
                    ),
                    Text(
                      "Seconds",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 55,
            ),
            isStoped
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (repeatedTimer!.isActive) {
                              setState(() {
                                repeatedTimer!.cancel();
                              });
                            } else {
                              startTimer();
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 12, 2, 107)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11))),
                              padding: WidgetStatePropertyAll(
                                  EdgeInsets.fromLTRB(30, 8, 30, 8))),
                          child: Text(
                            repeatedTimer!.isActive ? "Stop" : "Resume",
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              repeatedTimer!.cancel();
                              duration = Duration(seconds: 0);
                              isStoped = false;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 107, 14, 2)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11))),
                              padding: WidgetStatePropertyAll(
                                  EdgeInsets.fromLTRB(30, 8, 30, 8))),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          )),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      startTimer();
                      isStoped = true;
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            const Color.fromARGB(255, 12, 2, 107)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11))),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.fromLTRB(30, 8, 30, 8))),
                    child: Text(
                      "Start Timer",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ))
          ],
        ),
      ),
    );
  }
}
