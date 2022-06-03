import 'package:flutter/material.dart';
import 'package:low_perfomace_practice/home_screen.dart';
import 'package:low_perfomace_practice/mock_repository.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Low performance application',
      home: HomeScreen(repository: MockRepository()),
    ),
  );
}
