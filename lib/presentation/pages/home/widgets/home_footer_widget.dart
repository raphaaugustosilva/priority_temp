import 'package:flutter/material.dart';
import 'package:priority/presentation/utils/alert_messenger.dart';
import 'package:priority/presentation/presenters/home/home_presenter.dart';
import 'package:priority/presentation/pages/home/widgets/home_alert_button_widget.dart';

class HomeFooterWidget extends StatelessWidget {
  final HomePresenter presenter;
  const HomeFooterWidget(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeAlertButtonWidget(
              presenter,
              alertPriority: AlertPriority.error,
              icon: const Icon(Icons.error),
              label: "Error",
              backgroundColor: Colors.red,
            ),
            HomeAlertButtonWidget(
              presenter,
              alertPriority: AlertPriority.warning,
              icon: const Icon(Icons.warning_outlined),
              label: "Warning",
              backgroundColor: Colors.amber,
            ),
            HomeAlertButtonWidget(
              presenter,
              alertPriority: AlertPriority.info,
              icon: const Icon(Icons.info_outline),
              label: "Info",
              backgroundColor: Colors.lightGreen,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: ElevatedButton(
            onPressed: () => presenter.hideAlert(context),
            child: const Text('Hide alert'),
          ),
        ),
      ],
    );
  }
}
