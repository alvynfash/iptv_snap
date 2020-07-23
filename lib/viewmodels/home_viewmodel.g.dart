// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on HomeViewModelBase, Store {
  Computed<int> _$channelsCountComputed;

  @override
  int get channelsCount =>
      (_$channelsCountComputed ??= Computed<int>(() => super.channelsCount,
              name: 'HomeViewModelBase.channelsCount'))
          .value;
  Computed<ObservableList<String>> _$channelGroupNamesComputed;

  @override
  ObservableList<String> get channelGroupNames =>
      (_$channelGroupNamesComputed ??= Computed<ObservableList<String>>(
              () => super.channelGroupNames,
              name: 'HomeViewModelBase.channelGroupNames'))
          .value;
  Computed<bool> _$hasChannelGroupsComputed;

  @override
  bool get hasChannelGroups => (_$hasChannelGroupsComputed ??= Computed<bool>(
          () => super.hasChannelGroups,
          name: 'HomeViewModelBase.hasChannelGroups'))
      .value;
  Computed<ObservableList<String>> _$sortedChannelGroupNamesComputed;

  @override
  ObservableList<String> get sortedChannelGroupNames =>
      (_$sortedChannelGroupNamesComputed ??= Computed<ObservableList<String>>(
              () => super.sortedChannelGroupNames,
              name: 'HomeViewModelBase.sortedChannelGroupNames'))
          .value;
  Computed<bool> _$hasChannelsComputed;

  @override
  bool get hasChannels =>
      (_$hasChannelsComputed ??= Computed<bool>(() => super.hasChannels,
              name: 'HomeViewModelBase.hasChannels'))
          .value;
  Computed<int> _$sortedGroupsCountComputed;

  @override
  int get sortedGroupsCount => (_$sortedGroupsCountComputed ??= Computed<int>(
          () => super.sortedGroupsCount,
          name: 'HomeViewModelBase.sortedGroupsCount'))
      .value;
  Computed<ObservableMap<String, List<M3uGenericEntryExt>>> _$tvGroupsComputed;

  @override
  ObservableMap<String, List<M3uGenericEntryExt>> get tvGroups =>
      (_$tvGroupsComputed ??=
              Computed<ObservableMap<String, List<M3uGenericEntryExt>>>(
                  () => super.tvGroups,
                  name: 'HomeViewModelBase.tvGroups'))
          .value;
  Computed<bool> _$hasTvGroupsComputed;

  @override
  bool get hasTvGroups =>
      (_$hasTvGroupsComputed ??= Computed<bool>(() => super.hasTvGroups,
              name: 'HomeViewModelBase.hasTvGroups'))
          .value;
  Computed<ObservableList<String>> _$sortedTvGroupKeyComputed;

  @override
  ObservableList<String> get sortedTvGroupKey => (_$sortedTvGroupKeyComputed ??=
          Computed<ObservableList<String>>(() => super.sortedTvGroupKey,
              name: 'HomeViewModelBase.sortedTvGroupKey'))
      .value;
  Computed<int> _$tvGroupCountComputed;

  @override
  int get tvGroupCount =>
      (_$tvGroupCountComputed ??= Computed<int>(() => super.tvGroupCount,
              name: 'HomeViewModelBase.tvGroupCount'))
          .value;

  final _$selectedTabAtom = Atom(name: 'HomeViewModelBase.selectedTab');

  @override
  int get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(int value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  final _$channelsAtom = Atom(name: 'HomeViewModelBase.channels');

  @override
  ObservableList<M3uGenericEntryExt> get channels {
    _$channelsAtom.reportRead();
    return super.channels;
  }

  @override
  set channels(ObservableList<M3uGenericEntryExt> value) {
    _$channelsAtom.reportWrite(value, super.channels, () {
      super.channels = value;
    });
  }

  final _$channelGroupsAtom = Atom(name: 'HomeViewModelBase.channelGroups');

  @override
  ObservableMap<String, List<M3uGenericEntryExt>> get channelGroups {
    _$channelGroupsAtom.reportRead();
    return super.channelGroups;
  }

  @override
  set channelGroups(ObservableMap<String, List<M3uGenericEntryExt>> value) {
    _$channelGroupsAtom.reportWrite(value, super.channelGroups, () {
      super.channelGroups = value;
    });
  }

  final _$tvChannelsAtom = Atom(name: 'HomeViewModelBase.tvChannels');

  @override
  ObservableList<M3uGenericEntryExt> get tvChannels {
    _$tvChannelsAtom.reportRead();
    return super.tvChannels;
  }

  @override
  set tvChannels(ObservableList<M3uGenericEntryExt> value) {
    _$tvChannelsAtom.reportWrite(value, super.tvChannels, () {
      super.tvChannels = value;
    });
  }

  final _$_savedListAtom = Atom(name: 'HomeViewModelBase._savedList');

  @override
  ObservableList<M3uGenericEntryExt> get _savedList {
    _$_savedListAtom.reportRead();
    return super._savedList;
  }

  @override
  set _savedList(ObservableList<M3uGenericEntryExt> value) {
    _$_savedListAtom.reportWrite(value, super._savedList, () {
      super._savedList = value;
    });
  }

  final _$groupsAtom = Atom(name: 'HomeViewModelBase.groups');

  @override
  ObservableMap<String, List<M3uGenericEntryExt>> get groups {
    _$groupsAtom.reportRead();
    return super.groups;
  }

  @override
  set groups(ObservableMap<String, List<M3uGenericEntryExt>> value) {
    _$groupsAtom.reportWrite(value, super.groups, () {
      super.groups = value;
    });
  }

  final _$loadMoreChannelsAsyncAction =
      AsyncAction('HomeViewModelBase.loadMoreChannels');

  @override
  Future<dynamic> loadMoreChannels(
      {@required ObservableList<M3uGenericEntryExt> selectedChannel}) {
    return _$loadMoreChannelsAsyncAction
        .run(() => super.loadMoreChannels(selectedChannel: selectedChannel));
  }

  final _$getPlaylistFromFileAsyncAction =
      AsyncAction('HomeViewModelBase.getPlaylistFromFile');

  @override
  Future<dynamic> getPlaylistFromFile() {
    return _$getPlaylistFromFileAsyncAction
        .run(() => super.getPlaylistFromFile());
  }

  final _$resetPlaylistAsyncAction =
      AsyncAction('HomeViewModelBase.resetPlaylist');

  @override
  Future<dynamic> resetPlaylist() {
    return _$resetPlaylistAsyncAction.run(() => super.resetPlaylist());
  }

  @override
  String toString() {
    return '''
selectedTab: ${selectedTab},
channels: ${channels},
channelGroups: ${channelGroups},
tvChannels: ${tvChannels},
groups: ${groups},
channelsCount: ${channelsCount},
channelGroupNames: ${channelGroupNames},
hasChannelGroups: ${hasChannelGroups},
sortedChannelGroupNames: ${sortedChannelGroupNames},
hasChannels: ${hasChannels},
sortedGroupsCount: ${sortedGroupsCount},
tvGroups: ${tvGroups},
hasTvGroups: ${hasTvGroups},
sortedTvGroupKey: ${sortedTvGroupKey},
tvGroupCount: ${tvGroupCount}
    ''';
  }
}
