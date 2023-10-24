import 'package:flutter/material.dart';
import 'package:priority/presentation/utils/alert_messenger.dart';
import 'package:priority/presentation/presenters/home/mobx_home.dart';

class HomePresenter extends MobxHome {
  final List<({BuildContext context, AlertPriority alert})> _alertQueue = [];
  bool _isAlertShowing = false;

  Future<void> addAlertToQueue(BuildContext context, AlertPriority alert) async {
    bool isAlertHigher = _alertQueue.where((e) => e.alert.value > alert.value).firstOrNull == null;
    bool isAlertIsQueue = _alertQueue.where((e) => e.alert.value == alert.value).firstOrNull != null;

    if (isAlertHigher) {
      await _showAlert(context, alert);
    }

    if (!isAlertIsQueue) {
      _alertQueue.add((context: context, alert: alert));
      _alertQueue.sort((a, b) => b.alert.value.compareTo(a.alert.value));
      await _handleAlertExibition();
    }
  }

  Future<void> _handleAlertExibition() async {
    for (var item in _alertQueue) {
      if (!_isAlertShowing) {
        await _showAlert(item.context, item.alert);
      }
    }
  }

  Future<void> _showAlert(BuildContext context, AlertPriority alert) async {
    setCurrentAlert(alert);

    _isAlertShowing = true;
    await AlertMessenger.of(context).showAlert(
      alert: Alert(
        backgroundColor: currentAlert!.backgroundColor,
        leading: currentAlert!.icon,
        child: Text(currentAlert!.message),
      ),
    );
  }

  Future<void> hideAlert(BuildContext context) async {
    var alert = _alertQueue.where((e) => e.alert.value == currentAlert?.value).firstOrNull;
    if (alert != null) {
      await AlertMessenger.of(alert.context).hideAlert();

      _alertQueue.remove(alert);
      setCurrentAlert(null);
      _isAlertShowing = false;
    }

    _handleAlertExibition();
  }
}
