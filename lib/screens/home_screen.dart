import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iptv_snap/main.dart';
import 'package:iptv_snap/screens/controls/screen_loader.dart';
import 'package:iptv_snap/viewmodels.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'controls/group_tile.dart';
import 'controls/tabBar_Item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel vm;
  ScrollController channelScrollController;

  @override
  void initState() {
    vm = HomeViewModel()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyApp.bgTheme,
      body: SafeArea(
        child: Observer(
          builder: (_) => vm.isLoading
              ? screenLoader()
              : Container(
                  child: Column(
                    children: [
                      _buildSearchbar(),
                      _buildTabbar(),
                      _buildScrollableZone(),
                    ],
                  ),
                ),
        ),
      ),
      // floatingActionButton: Observer(
      //   builder: (_) => vm.hasTvGroups
      //       ? FloatingActionButton(
      //           onPressed: () async =>
      //               await Get.bottomSheet(_buildChannelsList()),
      //           // onPressed: () async => await Get.bottomSheet(_buildChannelsList()).then(
      //           //     (value) async => await Future.delayed(Duration(seconds: 2))
      //           //         .then((value) async => {}
      //           //await _channelScrollController?.animateTo(
      //           // 800.0,
      //           // duration: Duration(seconds: 2),
      //           // curve: Curves.fastLinearToSlowEaseIn,
      //           // ),
      //           // )),
      //           child: Icon(Icons.apps),
      //         )
      //       : Container(),
      // ),
    );
  }

  Widget _buildSearchbar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SearchBar(
              onSearch: null,
              onItemFound: (item, int index) {
                return Container();
              },
              hintText: 'Search',
              iconActiveColor: Colors.grey,
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              searchBarStyle: SearchBarStyle(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Get.bottomSheet(_buildSettingsLayout()),
          ),
        ],
      ),
    );
  }

  Widget _buildTabbar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          tabBarItem(
              text: 'TV Channels',
              onTap: () => print('Tab1 Tapped'),
              isSelected: true),
          tabBarItem(text: 'VOD', onTap: () => print('Tab2 Tapped')),
          tabBarItem(text: 'Series', onTap: () => print('Tab3 Tapped')),
        ],
      ),
    );
  }

  Widget _buildScrollableZone() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Observer(builder: (_) => vm.isBusy ? screenBusy() : _buildNow()),
      ),
    );
  }

  Widget _buildNow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Observer(
        builder: (context) => vm.hasTvGroups
            ? ListView.separated(
                itemCount: vm.tvGroupCount,
                itemBuilder: (_, index) {
                  final key = vm.sortedTvGroupKey[index];

                  return groupCard(
                    name: key,
                    channelsCount: vm.tvGroups[key].length,
                    onTap: () => Get.toNamed(
                      'channels',
                      arguments: vm.tvGroups[key],
                    ),
                  );
                },
                separatorBuilder: (_, index) => Container(height: 4),
              )
            : Center(
                // child: UnDraw(
                //   illustration: UnDrawIllustration.a_moment_to_relax,
                //   color: Colors.red,
                // ),
                ),
      ),
    );
  }

  Widget _buildSettingsLayout() {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () => vm.getPlaylistFromFile(),
            leading: Icon(
              Icons.playlist_add,
            ),
            title: Text('Get playlist'),
          ),
          ListTile(
            onTap: () => vm.resetPlaylist(),
            leading: Icon(
              Icons.refresh,
            ),
            title: Text('Reset playlist'),
          ),
          ListTile(
            leading: Icon(
              Icons.brightness_medium,
            ),
            title: Text('Appearance'),
          ),
        ],
      ),
    );
  }

  // Widget _buildChannelsList() {
  //   return Container(
  //     padding: const EdgeInsets.only(bottom: 32),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(30),
  //         topRight: Radius.circular(30),
  //       ),
  //     ),
  //     child: ListView(
  //       padding: const EdgeInsets.all(8),
  //       children: [
  //         ListTile(
  //           leading: Icon(
  //             Icons.email,
  //             // color: ScfmApp.greenTheme,
  //           ),
  //           title: Text('Add more regions'),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 16, right: 16),
  //           child: Divider(),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
