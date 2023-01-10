// Dart imports:
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

/// Note that the userID needs to be globally unique,
final String localUserID = math.Random().nextInt(10000).toString();
final TextEditingController _txtname =
    TextEditingController(text: "Enter Name");

/// Users who use the same callID can in the same call.
const String callID = "group_call_id";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Users who use the same conferenceID can in the same conference.
  var conferenceDTextCtrl = TextEditingController(text: "Enter Room Id");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          elevation: 00,
          title: Text('Video chat'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You Can Video Call Privately to Anyone With our App.'),
                SizedBox(
                  height: 20,
                ),
                Text('You Just Need Same Room Id To Start.'),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _txtname,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Enter Your Name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: conferenceDTextCtrl,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Enter Your Connection Id"),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return VideoConferencePage(
                              conferenceID: conferenceDTextCtrl.text,
                            );
                          }),
                        );
                      },
                      child: const Text(
                        "start",
                        style: TextStyle(fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: 1047193393,
        appSign:
            '58857725f9e75662121e0768949dcff9ffdafeec518ddd45712989c25d9066fb',
        userID: localUserID,
        userName: _txtname != null ? "${_txtname.text}" : "user_$localUserID",
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}
