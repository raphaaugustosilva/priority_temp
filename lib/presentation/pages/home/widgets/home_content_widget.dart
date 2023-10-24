import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:priority/presentation/presenters/home/home_presenter.dart';

class HomeContentWidget extends StatelessWidget {
  final HomePresenter presenter;
  const HomeContentWidget(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Observer(builder: (_) {
        return Text(
          presenter.currentAlertMessage,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 16.0,
          ),
        );
      }),
    );
  }
}
