import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:flutter/material.dart';

extension DialogExtensions on BuildContext {
  Future<void> buildFailureDialog(Failure failure, Function() onClickTryAgain) {
    return showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sorry, we had a problem.'),
          content: const Text(
            'A dialog is a type of modal window that\n'
            'appears in front of app content to\n'
            'provide critical information, or prompt\n'
            'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Try Again'),
              onPressed: () {
                onClickTryAgain.call();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
