// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channels_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChannelsViewModel on ChannelsViewModelBase, Store {
  Computed<int> _$channelsCountComputed;

  @override
  int get channelsCount =>
      (_$channelsCountComputed ??= Computed<int>(() => super.channelsCount,
              name: 'ChannelsViewModelBase.channelsCount'))
          .value;

  final _$channelsAtom = Atom(name: 'ChannelsViewModelBase.channels');

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

  final _$selectedTvChannelAtom =
      Atom(name: 'ChannelsViewModelBase.selectedTvChannel');

  @override
  M3uGenericEntryExt get selectedTvChannel {
    _$selectedTvChannelAtom.reportRead();
    return super.selectedTvChannel;
  }

  @override
  set selectedTvChannel(M3uGenericEntryExt value) {
    _$selectedTvChannelAtom.reportWrite(value, super.selectedTvChannel, () {
      super.selectedTvChannel = value;
    });
  }

  @override
  String toString() {
    return '''
channels: ${channels},
selectedTvChannel: ${selectedTvChannel},
channelsCount: ${channelsCount}
    ''';
  }
}
