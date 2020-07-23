// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseViewModel on BaseViewModellBase, Store {
  final _$isBusyAtom = Atom(name: 'BaseViewModellBase.isBusy');

  @override
  bool get isBusy {
    _$isBusyAtom.reportRead();
    return super.isBusy;
  }

  @override
  set isBusy(bool value) {
    _$isBusyAtom.reportWrite(value, super.isBusy, () {
      super.isBusy = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'BaseViewModellBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$doBusyTaskAsyncAction = AsyncAction('BaseViewModellBase.doBusyTask');

  @override
  Future<dynamic> doBusyTask(Future<dynamic> Function() task) {
    return _$doBusyTaskAsyncAction.run(() => super.doBusyTask(task));
  }

  final _$BaseViewModellBaseActionController =
      ActionController(name: 'BaseViewModellBase');

  @override
  void init({Object arguments}) {
    final _$actionInfo = _$BaseViewModellBaseActionController.startAction(
        name: 'BaseViewModellBase.init');
    try {
      return super.init(arguments: arguments);
    } finally {
      _$BaseViewModellBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool loading) {
    final _$actionInfo = _$BaseViewModellBaseActionController.startAction(
        name: 'BaseViewModellBase.setIsLoading');
    try {
      return super.setIsLoading(loading);
    } finally {
      _$BaseViewModellBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsBusy(bool busy) {
    final _$actionInfo = _$BaseViewModellBaseActionController.startAction(
        name: 'BaseViewModellBase.setIsBusy');
    try {
      return super.setIsBusy(busy);
    } finally {
      _$BaseViewModellBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isBusy: ${isBusy},
isLoading: ${isLoading}
    ''';
  }
}
