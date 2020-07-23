import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iptv_snap/main.dart';
import 'package:iptv_snap/viewmodels.dart';

import 'controls/channels_tile.dart';

class ChannelsScreen extends StatefulWidget {
  ChannelsScreen({Key key}) : super(key: key);

  @override
  _ChannelsScreenState createState() => _ChannelsScreenState();
}

class _ChannelsScreenState extends State<ChannelsScreen> {
  ChannelsViewModel vm;

  @override
  void initState() {
    vm = ChannelsViewModel()..init(arguments: Get.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back,
          size: 35,
          color: MyApp.greyTheme,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Stack(
        children: [
          _buildTitle(),
          _buildBodyWithCurvedHeader(),
        ],
      ),
    );
  }

  Widget _buildBodyWithCurvedHeader() {
    return Container(
      margin: EdgeInsets.only(top: 85),
      decoration: BoxDecoration(
        color: MyApp.bgTheme,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
        child: _buildChannelList(),
      ),
    );
  }

  Widget _buildChannelList() {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16),
      itemCount: vm.channelsCount,
      itemBuilder: (context, index) => channelTile(channel: vm.channels[index]),
      separatorBuilder: (context, index) => Container(
        height: 8,
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      color: Colors.white,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 32, top: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Channels',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
