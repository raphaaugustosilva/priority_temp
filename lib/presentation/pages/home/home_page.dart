import 'package:flutter/material.dart';
import 'package:priority/presentation/utils/alert_messenger.dart';
import 'package:priority/presentation/presenters/home/home_presenter.dart';
import 'package:priority/presentation/pages/home/widgets/home_footer_widget.dart';
import 'package:priority/presentation/pages/home/widgets/home_content_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePresenter presenter = HomePresenter();

    return AlertMessenger(
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              title: const Text('Alerts'),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: HomeContentWidget(presenter),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: HomeFooterWidget(presenter),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
