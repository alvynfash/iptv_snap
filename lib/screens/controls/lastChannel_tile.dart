import 'package:flutter/material.dart';
import 'package:iptv_snap/models/m3uGenericEntryExt.dart';

Widget lastChannelCard({M3uGenericEntryExt channel}) {
  return Container(
    // color: Colors.white,
    child: Container(
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: channel.hasLogo
            ? Image.network(
                channel.logo,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/defaultTvLogo.png',
                color: Colors.white,
              ),
      ),
    ),
  );
}
