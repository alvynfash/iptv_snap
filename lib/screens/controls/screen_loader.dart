import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget screenLoader() {
  return Container(
    child: Center(
      child: SpinKitWave(
        color: Colors.blue,
        size: 35,
      ),
    ),
  );
}

Widget screenBusy() {
  return Container(
    child: Center(
      child: SpinKitRipple(
        color: Colors.blue,
        size: 35,
      ),
    ),
  );
}
