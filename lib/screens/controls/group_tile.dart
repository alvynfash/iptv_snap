import 'package:flutter/material.dart';
import 'package:iptv_snap/extensions.dart';

Widget groupCard({
  @required String name,
  @required int channelsCount,
  @required Function onTap,
}) {
  return GestureDetector(
    onTap: () => onTap(),
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
      height: 50,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.s,
        children: [
          Container(
            width: 8,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
            child: Text(
              '${name.capitalizeFirstCharactersOnly}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Text(
            '(${channelsCount.toString()})',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          // CircleAvatar(child: Text(channelsCount.toString())),
        ],
      ),
    ),
  );
}
