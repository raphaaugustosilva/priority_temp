// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:priority/presentation/utils/alert_messenger.dart';

part 'mobx_home.g.dart';

class MobxHome = _MobxHomeBase with _$MobxHome;

abstract class _MobxHomeBase with Store {
  @observable
  AlertPriority? currentAlert;

  @action
  setCurrentAlert(AlertPriority? value) => currentAlert = value;

  @computed
  String get currentAlertMessage => currentAlert == null ? "" : currentAlert!.message;
}
