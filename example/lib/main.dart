import 'package:flutter/material.dart';
import 'package:flutter_debouncing_controllers/controllers.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter debouncing controllers example',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.green)),
      home: const MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final debouncingController = DebouncingTextController(
    duration: Duration(seconds: 2),
  )..addListener(_onTextChange);

  var debouncedText = '';

  // Triggered once the text is unchanged for 2 seconds.
  void _onTextChange() =>
      setState(() => debouncedText = debouncingController.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: debouncingController.textEditingController),
            SizedBox(height: 16),
            Text(debouncedText),
          ],
        ),
      ),
    );
  }
}
