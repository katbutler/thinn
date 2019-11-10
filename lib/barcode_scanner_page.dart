import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class BarcodeScannerPage extends StatefulWidget {
  final CameraDescription camera;

  const BarcodeScannerPage({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  BarcodeScannerPageState createState() => BarcodeScannerPageState();
}

class BarcodeScannerPageState extends State<BarcodeScannerPage> {
  // Add two variables to the state class to store the CameraController and
  // the Future.
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    // To display the current output from the camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Scaffold(
            body: Container(
              color: Colors.black,
              child: Stack(children: <Widget>[
                Center(
                  child: Transform.scale(
                    scale: (1 / _controller.value.aspectRatio) * 1.5,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(_controller),
                    ),
                  ),
                ),
                Center(
                  child: ClipPath(
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    clipper: CardClipper(),
                  ),
                ),
                SafeArea(
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () => _goBack(context),
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ]),
            ),
          );
        } else {
          // Otherwise, display a loading indicator.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class CardBounds extends StatelessWidget {
  const CardBounds({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.greenAccent, width: 10.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
    );
  }
}

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2),
              radius: size.width * 0.45),
          Radius.circular(10),
        ),
      )
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
