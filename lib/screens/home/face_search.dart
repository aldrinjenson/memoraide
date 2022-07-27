// import 'package:camera/camera.dart';
import 'dart:io';
import 'package:memoria/widgets/starter_design.dart';
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
      body: (Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'Face search screen',
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              print('presed');
              takePic();
            },
            child: Text('Take photo'),
          ),
          // WebView(
          //   initialUrl: 'https://flutter.dev',
          // ),
        ],
      )),
    );
  }
}
