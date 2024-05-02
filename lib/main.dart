// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lwk_dart/lwk_dart.dart' as lwk;
import 'package:path_provider/path_provider.dart';

void main() async {
  await lwk.LibLwk.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    const network = lwk.Network.testnet;

    final seeds = [
      'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial',
      'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon',
      'lumber tackle notice city expand cherry tonight people blue cactus forward scissors',
      'cancel taxi royal conduct once lizard belt orient inmate annual negative resemble',
    ];
    final index = Random().nextInt(3);
    print(index);

    final lwk.Descriptor descrip = await lwk.Descriptor.newConfidential(
      network: network,
      mnemonic: seeds[index],
    );

    final appDocDir = await getApplicationDocumentsDirectory();
    final String dbDir = '${appDocDir.path}/db';
    final descriptor = lwk.Descriptor(
      ctDescriptor: descrip.ctDescriptor,
    );

    print('----load lwk wallet: ');
    final now = DateTime.now();

    await lwk.Wallet.init(
      network: network,
      dbpath: dbDir,
      descriptor: descriptor,
    );

    final now1 = DateTime.now();
    print('----loaded lwk  wallet: ');
    print(now.toIso8601String());
    print(now1.toIso8601String());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
