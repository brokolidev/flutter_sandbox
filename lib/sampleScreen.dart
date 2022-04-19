import 'package:flutter/material.dart';
import 'package:flutter_sandbox/myProvider.dart';
import 'myProvider.dart';
import 'package:provider/provider.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SampleProvider>(
      create: (_) => SampleProvider(),
      child: const SampleScreenProvider(),
    );
  }
}

class SampleScreenProvider extends StatelessWidget {
  const SampleScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SampleProvider>(context);

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Column(
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                provider.sessionKey = '12334';
              },
              child: const Text('TextButton'),
            ),
            Center(
              child: Text(provider.sessionKey ?? "Loading..."),
            ),
          ],
        ),
      ),
    );
  }
}
