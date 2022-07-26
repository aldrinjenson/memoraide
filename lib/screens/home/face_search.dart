// import 'package:camera/camera.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class FaceSearch extends StatefulWidget {
  const FaceSearch({Key? key}) : super(key: key);

  @override
  State<FaceSearch> createState() => _FaceSearchState();
}

class _FaceSearchState extends State<FaceSearch> {
  void takePic() async {
    // final cameras = await availableCameras();
    // print(cameras);
    // final firstCamera = cameras.first;
    // print(firstCamera);
  }

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Memoria'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Face search screen'),
              TextButton(
                onPressed: () {
                  print('presed');
                  takePic();
                },
                child: Text('Take photo'),
              ),
              WebView(
                initialUrl: 'https://flutter.dev',
              )
            ],
          )),
        ));
  }
}
