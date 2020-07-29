import 'package:flutter/material.dart';
import 'package:iptv_snap/extensions.dart';

Widget groupCard({
  @required String name,
  @required int channelsCount,
  @required Function onTap,
}) {
  return GestureDetector(
    onTap: () => onTap(),
    // v1
    // child: Card(
    //   child: ListTile(
    //     leading: CircleAvatar(
    //       child: Text(channelsCount.toString()),
    //     ),
    //     title: Text(
    //       '${name.capitalizeFirstCharactersOnly}',
    //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    //     ),
    //   ),
    // ),

    child: Container(
      height: 70,
      child: Row(
        children: [
          Container(
            width: 8,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '(${channelsCount.toString()})',
                  style: TextStyle(color: Colors.blue, fontSize: 10),
                ),
                Text(
                  '${name.capitalizeFirstCharactersOnly}',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
