import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeInOut(
        color: Color(0xFF00d3f5),
        size: 80,
      ),
      //   child: CircularProgressIndicator(
      // color: Color(0xFF6200EE),
    );
  }
}
