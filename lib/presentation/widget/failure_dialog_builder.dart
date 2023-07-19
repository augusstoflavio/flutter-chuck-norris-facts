import 'package:chuck_norris_facts/data/remote/failure/api_failure.dart';
import 'package:chuck_norris_facts/data/remote/failure/no_connection_failure.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension DialogExtensions on BuildContext {
  Future<void> buildFailureDialog(Failure failure, Function() onClickTryAgain) {
    return showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_getTitleByFailure(failure)),
          content: Text(_getMessageByFailure(failure)),
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

  String _getTitleByFailure(Failure failure) {
    if (failure is NoConnectionFailure) {
      return "No connection";
    } else {
      return "Sorry, we had a problem.";
    }
  }

  String _getMessageByFailure(Failure failure) {
    if (failure is NoConnectionFailure) {
      return "Please check your connection and try again.";
    } if (failure is ApiFailure && kDebugMode) {
      return failure.apiErrorMessage;
    } else {
      return "We had a problem, please try again later.";
    }
  }
}
