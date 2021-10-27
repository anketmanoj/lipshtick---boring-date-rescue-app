import 'dart:async';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:gbff/constants.dart';
import 'dart:math';

class TimerScreen extends StatefulWidget {
  String? saviorName;
  TimerScreen({Key? key, this.saviorName}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Timer? timer;
  int randomIndex = 0;

  @override
  void initState() {
    super.initState();
    startTimeout();

    timer = Timer.periodic(Duration(seconds: 10), (Timer t) {
      setState(() {
        randomIndex = Random().nextInt(datingFunFacts.length);
      });
    });
  }

  List<String> datingFunFacts = [
    'Before a couple enters into a serious relationship, they will go for at least 6-8 dates.',
    'Studies suggest that most of the breakups take place within 3 months to 5 months of a relationship.',
    'Couples will trade house keys but that won’t happen before 12 to 14 dates.',
    'Online daters have a uniform segregation. 33% end up in a relationship, 33% do not and 33% simply give up.',
    'In workplace scenarios, 4 of 10 relationships end up in marriage.',
    'It is not the words of a man but the posture in which he stands makes 80% of the impression of a woman in first date.',
    'Fast food centers, strip clubs, X-rated movies, house of your parents, school play or birthday party of your kids are all terrible places for first date.',
    'On an average, daters take about 4 to 6 dates to have sex.',
    'According to eHarmony, every single day, 236 members get married through their platform.',
    'Typically, dating specialists suggest waiting until the third date to cook someone dinner at home.',
    'Choosing exciting places for a first date increases the chances of the other person falling for you. There is a definitive link between danger and physical/romantic attraction.',
    'Italian food is one of the most popular restaurants for a first date.',
  ];

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 180;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          print("Navigate to Call Screen");
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<bool> _willPopCallback() async {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text:
            "Sorry, you started the save me timer. Once the timer is over, you will recieve a call from ${widget.saviorName}",
        title: timerText);
    // await showDialog or Show add banners or whatever
    // then
    return false; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: analogClock(),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Dating facts:",
                  style:
                      kTitleTextStyle.copyWith(fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Text(
                    datingFunFacts[randomIndex],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Call Count Down"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.timer),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      timerText,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  FlutterAnalogClock analogClock() {
    return FlutterAnalogClock(
      dateTime: DateTime.now(),
      dialPlateColor: Colors.black,
      hourHandColor: Colors.white,
      minuteHandColor: Colors.white,
      secondHandColor: Colors.white,
      numberColor: Colors.white,
      borderColor: Colors.white,
      tickColor: Colors.white,
      centerPointColor: Colors.black,
      showBorder: true,
      showTicks: true,
      showMinuteHand: true,
      showSecondHand: true,
      showNumber: true,
      borderWidth: 8.0,
      hourNumberScale: .10,
      hourNumbers: [
        'I',
        'II',
        'III',
        'IV',
        'V',
        'VI',
        'VII',
        'VIII',
        'IX',
        'X',
        'XI',
        'XII'
      ],
      isLive: true,
      width: 200.0,
      height: 200.0,
      decoration: const BoxDecoration(),
    );
  }
}
