import 'package:flutter/material.dart';
import 'package:priority/presentation/utils/alert_messenger.dart';
import 'package:priority/presentation/presenters/home/home_presenter.dart';

class HomeAlertButtonWidget extends StatelessWidget {
  final HomePresenter presenter;
  final AlertPriority alertPriority;
  final Icon icon;
  final String label;
  final Color backgroundColor;
  const HomeAlertButtonWidget(this.presenter, {super.key, required this.alertPriority, required this.icon, required this.label, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => presenter.addAlertToQueue(context, alertPriority),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          const SizedBox(width: 4.0),
          Text(label),
        ],
      ),
    );
  }
}
