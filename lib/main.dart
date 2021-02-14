import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// wrap general app inside ProviderScope

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

/// making a global variable to use provider anywhere
final greetingProvider = Provider((ref) => 'Hello Riverpod!');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod example',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Riverpod|Example"),
        ),
        body: Center(
          child: Consumer(
            builder: (context, watch,child) {
              final greeting = watch(greetingProvider);
              return Text(greeting);
            }
          ),
        ),
      ),
    );
  }
}

/// we have two ways to use riverpod
/// 1) using ConsumerWidget => rebuild all MaterialApp
/// 2) using Consumer on specific widget => rebuild this widget only
/// 3) if we are in onPressed fun and we wanna use watch u have declare it
///    as following:
///    context.read(provider).method();