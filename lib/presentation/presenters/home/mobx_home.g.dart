// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxHome on _MobxHomeBase, Store {
  Computed<String>? _$currentAlertMessageComputed;

  @override
  String get currentAlertMessage => (_$currentAlertMessageComputed ??=
          Computed<String>(() => super.currentAlertMessage,
              name: '_MobxHomeBase.currentAlertMessage'))
      .value;

  late final _$currentAlertAtom =
      Atom(name: '_MobxHomeBase.currentAlert', context: context);

  @override
  AlertPriority? get currentAlert {
    _$currentAlertAtom.reportRead();
    return super.currentAlert;
  }

  @override
  set currentAlert(AlertPriority? value) {
    _$currentAlertAtom.reportWrite(value, super.currentAlert, () {
      super.currentAlert = value;
    });
  }

  late final _$_MobxHomeBaseActionController =
      ActionController(name: '_MobxHomeBase', context: context);

  @override
  dynamic setCurrentAlert(AlertPriority? value) {
    final _$actionInfo = _$_MobxHomeBaseActionController.startAction(
        name: '_MobxHomeBase.setCurrentAlert');
    try {
      return super.setCurrentAlert(value);
    } finally {
      _$_MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentAlert: ${currentAlert},
currentAlertMessage: ${currentAlertMessage}
    ''';
  }
}
