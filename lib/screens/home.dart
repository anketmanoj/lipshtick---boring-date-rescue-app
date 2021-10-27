import 'package:flutter/material.dart';
import 'package:gbff/constants.dart';
import 'package:gbff/screens/selectedSavior.dart';
import 'package:gbff/widgets/WelcomeHeader.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> callerText = [
    'Mom',
    'Dad',
    'Granny',
    'Brother',
  ];

  List<String> imagesList = [
    'assets/mom.png',
    'assets/dad.png',
    'assets/gmom.png',
    'assets/brother.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: WelcomeHeader()),
              SizedBox(
                height: 20,
              ),
              Text(
                "An app to save you from boring dates so you can go back to watching reruns of Friends at home ☺",
                textAlign: TextAlign.center,
                style: kTitleTextStyle.copyWith(fontWeight: FontWeight.normal),
              ),
              Divider(),
              Text(
                "Select your savior",
                style: kTitleTextStyle.copyWith(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 260,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: callerText.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedSavior(
                            saviorImg: imagesList[index],
                            saviorName: callerText[index],
                          ),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Image.asset(imagesList[index]),
                              height: 80,
                            ),
                            Text(
                              callerText[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: Container(
                  height: 120,
                  width: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset('assets/dog.png'),
                        height: 80,
                      ),
                      Text(
                        'Alfie',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
