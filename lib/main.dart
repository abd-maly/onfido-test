import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onfido_sdk/onfido_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _incrementCounter() async {
    try {
      final Onfido onFido = Onfido(
        //expired token
        sdkToken:
            'eyJhbGciOiJFUzUxMiJ9.eyJleHAiOjE2ODU2MTA1ODAsInBheWxvYWQiOnsiYXBwIjoiNGMxY2Y3ZTItOTRhZC00NWQ5LWEzZGMtNmZjZDVlOTVmNTZmIiwiY2xpZW50X3V1aWQiOiI1MzUzNGVkOC1hZjIyLTRlNmYtOTE3MS1iZmQxM2Q1ZDc5OTEiLCJpc19zYW5kYm94IjpmYWxzZSwiaXNfc2VsZl9zZXJ2aWNlX3RyaWFsIjpmYWxzZSwiaXNfdHJpYWwiOmZhbHNlLCJzYXJkaW5lX3Nlc3Npb24iOiIzMzViZmJiNS0zM2I4LTQ5ZDEtOTYxZS00N2Y3NDAzMTFhOWUifSwidXVpZCI6InBsYXRmb3JtX3N0YXRpY19hcGlfdG9rZW5fdXVpZCIsInVybHMiOnsiZGV0ZWN0X2RvY3VtZW50X3VybCI6Imh0dHBzOi8vc2RrLm9uZmlkby5jb20iLCJzeW5jX3VybCI6Imh0dHBzOi8vc3luYy5vbmZpZG8uY29tIiwiaG9zdGVkX3Nka191cmwiOiJodHRwczovL2lkLm9uZmlkby5jb20iLCJhdXRoX3VybCI6Imh0dHBzOi8vYXBpLm9uZmlkby5jb20iLCJvbmZpZG9fYXBpX3VybCI6Imh0dHBzOi8vYXBpLm9uZmlkby5jb20iLCJ0ZWxlcGhvbnlfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSJ9fQ.MIGHAkEsTjUoEy-KL-cnp4VDRmv30HMtu25ksAR_msAzuJ77gJXV3E2FNpsCZjW0uifrPM9DzZgvEu2y68nYmcI-1koQhwJCAUm7wymd0A9TIO3CC-Lg5svkfY0NofIcn1AjzYHbtOw0fFQH-2FByiVE9_bNavZEiyweGUYyJ4sFB_lua8e1_Tyq',
      );
      await onFido
          .start(
            flowSteps: FlowSteps(
              proofOfAddress: false,
              welcome: true,
              documentCapture: DocumentCapture(
                  countryCode: CountryCode.ARE,
                  documentType: DocumentType.generic),
              faceCapture: FaceCaptureType.video,
            ),
          )
          .then((response) => {print('done')});
    } on PlatformException catch (e) {
      if (e.message == 'token expired') {
      } else if (e.message == 'User canceled the flow') {
      } else {}
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Onfido test'),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'start OnFido',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
