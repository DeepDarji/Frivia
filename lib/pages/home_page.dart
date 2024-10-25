import 'package:flutter/material.dart';
import 'package:frivia/pages/game_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _devieHeight, _deviceWidth;

  double _currentDifficultyLevel = 0;

  final List<String> _difficultyText = ["Easy", "Medium", "Hard"];

  @override
  Widget build(BuildContext context) {
    _devieHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _appTitle(),
                _difficultySlider(),
                _startButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appTitle() {
    return Column(
      children: [
        const Text(
          "Frivia",
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          _difficultyText[_currentDifficultyLevel.toInt()],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _difficultySlider() {
    return Slider(
      label: "Difficulty",
      min: 0,
      max: 2,
      divisions: 2,
      value: _currentDifficultyLevel,
      onChanged: (_value) {
        setState(
          () {
            _currentDifficultyLevel = _value;
          },
        );
      },
    );
  }

  Widget _startButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext) {
              return GamePage(
                difficultyLevel:
                    _difficultyText[_currentDifficultyLevel.toInt()]
                        .toLowerCase(),
              );
            },
          ),
        );
      },
      color: Colors.blue,
      minWidth: _deviceWidth! * 0.80,
      height: _devieHeight! * 0.10,
      child: const Text(
        "Start",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
