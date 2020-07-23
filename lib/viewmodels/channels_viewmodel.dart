import 'package:mobx/mobx.dart';
import 'base_viewmodel.dart';
import 'package:iptv_snap/models/m3uGenericEntryExt.dart';

part 'channels_viewmodel.g.dart';

class ChannelsViewModel = ChannelsViewModelBase with _$ChannelsViewModel;

abstract class ChannelsViewModelBase extends BaseViewModel with Store {
  @observable
  ObservableList<M3uGenericEntryExt> channels =
      ObservableList<M3uGenericEntryExt>();

  @computed
  int get channelsCount => channels.length;

  @observable
  M3uGenericEntryExt selectedTvChannel;

  @override
  void init({Object arguments}) {
    super.init(arguments: arguments);
    channels = ObservableList<M3uGenericEntryExt>.of(arguments);
  }
}
