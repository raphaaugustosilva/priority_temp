import 'package:flutter/material.dart';
import 'package:priority/presentation/utils/alert_messenger.dart';
import 'package:priority/presentation/presenters/home/mobx_home.dart';

class HomePresenter extends MobxHome {
  final List<({BuildContext context, AlertPriority alert})> _alertQueue = [];
  bool _isAlertShowing = false;

  void addAlertToQueue(BuildContext context, AlertPriority alert) {
    bool isAlertHigher = _alertQueue.where((e) => e.alert.value > alert.value).firstOrNull == null;
    bool isAlertIsQueue = _alertQueue.where((e) => e.alert.value == alert.value).firstOrNull != null;

    if (isAlertHigher) {
      _showAlert(context, alert);
    }

    if (!isAlertIsQueue) {
      _alertQueue.add((context: context, alert: alert));
      _alertQueue.sort((a, b) => b.alert.value.compareTo(a.alert.value));
      _handleAlertExibition();
    }
  }

  void _handleAlertExibition() {
    for (var item in _alertQueue) {
      if (!_isAlertShowing) {
        _showAlert(item.context, item.alert);
      }
    }
  }

  void _showAlert(BuildContext context, AlertPriority alert) {
    setCurrentAlert(alert);

    _isAlertShowing = true;
    AlertMessenger.of(context).showAlert(
      alert: Alert(
        backgroundColor: currentAlert!.backgroundColor,
        leading: currentAlert!.icon,
        child: Text(currentAlert!.message),
      ),
    );
  }

  void hideAlert(BuildContext context) {
    var alert = _alertQueue.where((e) => e.alert.value == currentAlert?.value).firstOrNull;
    if (alert != null) {
      AlertMessenger.of(alert.context).hideAlert();

      _alertQueue.remove(alert);
      setCurrentAlert(null);
      _isAlertShowing = false;
    }

    _handleAlertExibition();
  }
}
