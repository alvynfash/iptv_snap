import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iptv_snap/models/m3uGenericEntryExt.dart';
import 'package:transparent_image/transparent_image.dart';

Widget channelTile({@required M3uGenericEntryExt channel}) {
  return GestureDetector(
    onTap: () => Get.toNamed('player', arguments: channel),
    child: Card(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: Container(
            height: 60,
            width: 80,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Colors.white, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: channel.hasLogo
                ? FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    fit: BoxFit.fill,
                    image: channel.logo,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset(
                      'assets/images/defaultTvLogo.png',
                      color: Colors.white,
                    ),
                  )
                : Image.asset(
                    'assets/images/defaultTvLogo.png',
                    color: Colors.white,
                  ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              // height: 40,
              margin: const EdgeInsets.only(bottom: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    channel.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          'Uptime',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //   '9:00 am - 1:00 pm',
                  //   style: TextStyle(fontSize: 12),
                  // ),
                  // LinearPercentIndicator(
                  //   progressColor: Colors.blue,
                  //   backgroundColor: Colors.grey[300],
                  //   lineHeight: 3.5,
                  //   percent: .82,
                  //   padding: EdgeInsets.only(top: 8),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
