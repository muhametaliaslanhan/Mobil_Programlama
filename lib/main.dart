import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Like Dislike App',
      home: LikeDislikeScreen(),
    );
  }
}

class LikeDislikeScreen extends StatefulWidget {
  @override
  _LikeDislikeScreenState createState() => _LikeDislikeScreenState();
}

class _LikeDislikeScreenState extends State<LikeDislikeScreen> {
  final List<String> names = [
    'Muhammet ali',
    'İbrahim',
    'Ahmet',
    'Kutalmış',
    'Kerem',
    'Melih',
    'Batuhan'
  ];
  final Random _random = Random();

  late String _currentName;
  List<String> _likedNames = [];
  List<String> _dislikedNames = [];

  @override
  void initState() {
    super.initState();
    _currentName = _getRandomName();
  }

  String _getRandomName() {
    return names[_random.nextInt(names.length)];
  }

  void _likeName() {
    setState(() {
      _likedNames.add(_currentName);
      _currentName = _getRandomName();
    });
  }

  void _dislikeName() {
    setState(() {
      _dislikedNames.add(_currentName);
      _currentName = _getRandomName();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Like Dislike App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Do you like this name?',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            _currentName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _likeName,
                child: Text('Like'),
              ),
              ElevatedButton(
                onPressed: _dislikeName,
                child: Text('Dislike'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Liked Names:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          for (var name in _likedNames) Text(name),
          SizedBox(height: 20),
          Text(
            'Disliked Names:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          for (var name in _dislikedNames) Text(name),
        ],
      ),
    );
  }
}