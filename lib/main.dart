// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import 'package:storyline/story_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

StroyBrain story = StroyBrain();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int choiceNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/storyLine.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Text(
                  story.getStory(story.getStoryNumber()),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 100.0,
                  child: ElevatedButton(
                    onPressed: () {
                      choiceNumber = 1;
                      setState(() {
                        story.nextStory(choiceNumber);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                    ),
                    child: Text(
                      story.getChoice1(story.getStoryNumber()),
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: story.buttonShouldBeVisible(),
                child: Expanded(
                  flex: 1,
                  child: ButtonTheme(
                    minWidth: 200.0,
                    height: 100.0,
                    child: ElevatedButton(
                      onPressed: () {
                        choiceNumber = 2;
                        setState(() {
                          story.nextStory(choiceNumber);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // background
                      ),
                      child: Text(
                        story.getChoice2(story.getStoryNumber()),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
