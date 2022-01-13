import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int endTime = DateTime(2022, 1, 23).millisecondsSinceEpoch + 1000 * 30;

  void onEnd() {
    print('onEnd');
  }

  _launchMaps() async {
    String googleUrl =
        'comgooglemaps://?center=${10.78698909845844},${79.12592897822516}';
    String appleUrl =
        'https://www.google.com/maps/search/?api=1&query=10.78698909845844,79.12592897822516';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  children: [
                    SizedBox(height: 45),
                    Text('Save the Date 23 JAN 2022 ',
                        style: GoogleFonts.lobster(
                            color: Colors.indigo[900],
                            fontSize: 18,
                            letterSpacing: 0.9,
                            fontStyle: FontStyle.normal)),
                    SizedBox(height: 25),
                    CountdownTimer(
                      endTime: endTime,
                      onEnd: onEnd,
                      widgetBuilder: (_, CurrentRemainingTime time) {
                        if (time == null) {
                          return Text(
                            'நாழி முடிந்துருது!!',
                            style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal),
                          );
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Colors.white),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          '${time.days}\n',
                                          style: TextStyle(
                                              color: Colors.indigo[900],
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: Text(
                                        'Days',
                                        style: TextStyle(
                                            color: Colors.indigo[900],
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Colors.white),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          '${time.hours}\n',
                                          style: TextStyle(
                                              color: Colors.indigo[900],
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: Text(
                                        'Hours',
                                        style: TextStyle(
                                            color: Colors.indigo[900],
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Colors.white),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          '${time.min}\n',
                                          style: TextStyle(
                                              color: Colors.indigo[900],
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: Text(
                                        'Min',
                                        style: TextStyle(
                                            color: Colors.indigo[900],
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Colors.white),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          '${time.sec}\n',
                                          style: TextStyle(
                                              color: Colors.indigo[900],
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: Text(
                                        'Sec',
                                        style: TextStyle(
                                            color: Colors.indigo[900],
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0, right: 40),
                      child: Text("Deepika 💝 Karthick Raj",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.calligraffitti(
                              color: Colors.indigo[900],
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal)),
                    ),
                    Lottie.asset('assets/lottie/loveheart.json',
                        height: 250, width: MediaQuery.of(context).size.width),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 6, right: 6, top: 12, bottom: 12),
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: const Color(0xFFa30815).withOpacity(0.5),
                ),
                child: Text(
                    "We Cherish the role you have played in our story so far and we'd love it for you to come and join us in our celebrations",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Calligraffitti',
                        color: Color(0xFFffffff),
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal)),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: const Color(0xFF000000).withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text('Reception : ',
                          style: GoogleFonts.lobster(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 0.9,
                              fontStyle: FontStyle.normal)),
                      Text(
                        'Jan 22(Saturday - 6.30 PM Onwards)\nMuhurtham :\nJan 23(Sunday - 7.30 AM - 9.30 AM)',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lobster(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 0.9,
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 22),
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: const Color(0xFF000000).withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        'Where : ',
                        style: GoogleFonts.lobster(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 0.9,
                            fontStyle: FontStyle.normal),
                      ),
                      Text(
                        'Siva chidambaram pillai kalyana mandapam\nKamarajar Road,Srinivasapuram,Thanjai-613009',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lobster(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 0.9,
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 10, right: 10,bottom: 20),
                child: SwipingButton(
                  text: "Location",
                  height: 60,
                  swipeButtonColor: Colors.green,
                  backgroundColor: Colors.green[300],
                  onSwipeCallback: () {
                    _launchMaps();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
