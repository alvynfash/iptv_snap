import 'package:mobx/mobx.dart';

part 'base_viewmodel.g.dart';

class BaseViewModel = BaseViewModellBase with _$BaseViewModel;

abstract class BaseViewModellBase with Store {
  @observable
  bool isBusy = false;

  @observable
  bool isLoading = false;

  @action
  void init({Object arguments}) {
    print(
        '${this.runtimeType} initialised with arguments : ${arguments.toString()}');
  }

  @action
  void setIsLoading(bool loading) {
    // ensureKeyboardDismiss();s
    isLoading = loading;
  }

  @action
  void setIsBusy(bool busy) {
    // ensureKeyboardDismiss();
    isBusy = busy;
  }

  @action
  Future doBusyTask(Future Function() task) async {
    setIsBusy(true);
    // ensureKeyboardDismiss();
    await task.call();
    setIsBusy(false);
  }
}

enum vmStates {
  loading,
  busy,
}
