import 'package:flutter/material.dart';
import 'package:gbff/constants.dart';
import 'package:gbff/screens/timerScreen.dart';

class SelectedSavior extends StatefulWidget {
  final String saviorName;
  final String saviorImg;
  const SelectedSavior(
      {Key? key, this.saviorName = "wows", this.saviorImg = "default"})
      : super(key: key);

  @override
  _SelectedSaviorState createState() => _SelectedSaviorState();
}

class _SelectedSaviorState extends State<SelectedSavior> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Last step to be rescued",
          style: kTitleTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Selected Savior",
                style: kTitleTextStyle.copyWith(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  height: 160,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(widget.saviorImg),
                        height: 120,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.saviorName,
                        style: kTitleTextStyle.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "They will call you in",
                style: kTitleTextStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "3 Minutes",
                style: kTitleTextStyle.copyWith(
                  fontSize: 30,
                  letterSpacing: 3,
                  color: Colors.lightBlue,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TimerScreen(
                            saviorName: widget.saviorName,
                          ),
                        ),
                      ),
                  icon: Icon(Icons.call),
                  label: Text("Cool, save me!"))
            ],
          ),
        ),
      ),
    );
  }
}
