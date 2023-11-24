import 'dart:math';

import 'package:flutter/material.dart';
import 'package:live_streaming/live_screen.dart';
import 'package:live_streaming/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final liveController = TextEditingController();
  final String userId = Random().nextInt(900000 + 100000).toString();

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ElevatedButton.styleFrom(
        fixedSize: const Size(120, 60), primary: Colors.orange);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Live Stream",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Your User ID: $userId"),
            const Text('Please Test with two or more devices'),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: liveController,
              decoration: InputDecoration(
                labelText: "Join or Start a Live By Input an ID",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: buttonStyles,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LiveScreenView(
                            liveID: liveController.text,
                            userId: userId,
                            isHost: true),
                      ));
                },
                child: Text('Start a Live', style: TextStyle(color: Colors.white),)),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: buttonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LiveScreenView(
                            liveID: liveController.text,
                            userId: userId,
                            isHost: false),
                      ));
                },
                child: Text('Join a Live',style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}

