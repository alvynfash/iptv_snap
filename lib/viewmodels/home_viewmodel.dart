import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:iptv_snap/models/m3uGenericEntryExt.dart';
import 'package:m3u/m3u.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase extends BaseViewModel with Store {
  @observable
  int selectedTab = 0;

  @observable
  ObservableList<M3uGenericEntryExt> channels =
      ObservableList<M3uGenericEntryExt>();

  @computed
  int get channelsCount => channels.length;

  @observable
  ObservableMap<String, List<M3uGenericEntryExt>> channelGroups =
      ObservableMap<String, List<M3uGenericEntryExt>>();

  @computed
  ObservableList<String> get channelGroupNames => channelGroups.keys;

  @computed
  bool get hasChannelGroups => channelGroupNames.isNotEmpty;

  @computed
  ObservableList<String> get sortedChannelGroupNames => channelGroupNames
    ..sort((a, b) => a.substring(0).compareTo(b.substring(0)));

  @computed
  bool get hasChannels => channels.isNotEmpty;

  @observable
  ObservableList<M3uGenericEntryExt> tvChannels =
      ObservableList<M3uGenericEntryExt>();

  // ObservableMap<String, List<M3uGenericEntryExt>> vodChannels;
  // ObservableMap<String, List<M3uGenericEntryExt>> seriesChannels;

  @observable
  ObservableList<M3uGenericEntryExt> _savedList =
      ObservableList<M3uGenericEntryExt>();

  @observable
  ObservableMap<String, List<M3uGenericEntryExt>> groups =
      ObservableMap<String, List<M3uGenericEntryExt>>();

  @computed
  int get sortedGroupsCount => groups.length;

  @computed
  ObservableMap<String, List<M3uGenericEntryExt>> get tvGroups {
    return ObservableMap<String, List<M3uGenericEntryExt>>.of(
      Map.fromIterables(
        groups.keys.toList(),
        groups.values.toList(),
      )..removeWhere(
          (key, value) =>
              key.toLowerCase().contains('vod') ||
              key.toLowerCase().contains('series'),
        ),
    );
  }

  @computed
  bool get hasTvGroups => tvGroups.isNotEmpty;

  @computed
  ObservableList<String> get sortedTvGroupKey => ObservableList<String>.of(
        tvGroups.keys.toList()..sort((a, b) => a.compareTo(b)),
      );

  @computed
  int get tvGroupCount => tvGroups?.length;

  HomeViewModelBase() {
    //todo: load db and populate default props eg nowOnTvList
  }

  @override
  void init({Object arguments}) {
    super.init(arguments: arguments);
    _checkDB();
  }

  Future _checkDB() async {
    try {
      setIsLoading(true);

      var diffDays = DateTime(2020, 08, 01).difference(DateTime.now()).inDays;
      if (diffDays < 0) {
        await Future.delayed(Duration(seconds: 2));
        Get.defaultDialog(
            title: 'Sorry',
            middleText:
                'Seems like your trial has expired. \nYou can still import your playlist or \ncontact +33 75 41 58 56 5 ');
        return;
      }

      final fileContent =
          await rootBundle.loadString('assets/files/playlist.m3u');
      final parsedResult = await parseFile(fileContent);

      _savedList.clear();
      _savedList.addAll(
          parsedResult.map((result) => M3uGenericEntryExt(result)).toList());

      //todo: save to reactive db that is observed to update the observable properties of this vm
      channels.clear();
      loadMoreChannels(selectedChannel: channels);

      var scExt =
          sortedCategories(entries: parsedResult, attributeName: 'group-title')
              .map((key, value) => MapEntry<String, List<M3uGenericEntryExt>>(
                  key, value.map((e) => M3uGenericEntryExt(e)).toList()));

      groups.clear();
      groups.addAll(scExt);

      channelGroups.clear();
      channelGroups.addAll(scExt);
    } catch (e) {
      print("ERROR - _checkDB() : ${e.toString()}");
    } finally {
      setIsLoading(false);
    }
  }

  @action
  Future loadMoreChannels({
    @required ObservableList<M3uGenericEntryExt> selectedChannel,
  }) async {
    print('loadMoreChannels called');
    await Future.delayed(Duration(microseconds: 10));
    selectedChannel.addAll(_savedList.skip(selectedChannel.length).take(10));
  }

  @action
  Future getPlaylistFromFile() async {
    try {
      print('getPlaylistFromFile called');
      setIsBusy(true);
      Get.back();
      final file = await FilePicker.getFile(
        type: FileType.custom,
        allowedExtensions: ['m3u', 'm3u8', 'txt'],
      );

      if (file == null) return;

      final fileContent = await file.readAsString();
      // var decoded = utf8.decode(fileContent.runes.toList());
      final parsedResult = await parseFile(fileContent);
      _savedList.clear();
      _savedList.addAll(
          parsedResult.map((result) => M3uGenericEntryExt(result)).toList());

      //todo: save to reactive db that is observed to update the observable properties of this vm
      channels.clear();
      loadMoreChannels(selectedChannel: channels);

      var scExt =
          sortedCategories(entries: parsedResult, attributeName: 'group-title')
              .map((key, value) => MapEntry<String, List<M3uGenericEntryExt>>(
                  key, value.map((e) => M3uGenericEntryExt(e)).toList()));

      groups.clear();
      groups.addAll(scExt);

      channelGroups.clear();
      channelGroups.addAll(scExt);
    } catch (e) {
      print("ERROR - _getPlaylistFromFile() : ${e.toString()}");
    } finally {
      setIsBusy(false);
    }
  }

  @action
  Future resetPlaylist() async {
    await doBusyTask(() async {
      Get.back();
      await Future.delayed(Duration(seconds: 2));
      channels.clear();
      _savedList.clear();
      groups.clear();
      channelGroups.clear();
    });
  }
}

const mp4List = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.jpg",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
];

const channelsList = [
  "http://pro.waldi2017.com:8789/live/110020965298006/61218131/788.m3u8",
  "http://pro.waldi2017.com:8789/live/110020965298006/61218131/787.m3u8",
  "http://pro.waldi2017.com:8789/live/110020965298006/61218131/786.m3u8",
  "http://pro.waldi2017.com:8789/live/110020965298006/61218131/785.m3u8",
  "http://pro.waldi2017.com:8789/live/110020965298006/61218131/784.m3u8",
  "http://pro.waldi2017.com:8789/live/110020965298006/61218131/783.m3u8",
  "http://pro.waldi2017.com:8789/live/110020965298006/61218131/782.m3u8",
  "http://pro.waldi2017.com:8789/live/110020965298006/61218131/781.m3u8",
  "http://pro.waldi2017.com:8789/live/110020965298006/61218131/780.m3u8",
  "http://pro.waldi2017.com:8789/live/110020965298006/61218131/779.m3u8",
];
