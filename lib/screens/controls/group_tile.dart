import 'package:flutter/material.dart';
import 'package:iptv_snap/extensions.dart';

Widget groupCard({
  @required String name,
  @required int channelsCount,
  @required Function onTap,
}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(channelsCount.toString()),
        ),
        title: Text(
          '${name.capitalizeFirstCharactersOnly}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    ),
  );
}
