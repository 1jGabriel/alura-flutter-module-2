import 'package:bytebank/database/contact_dao.dart';
import 'package:bytebank/network/webclients/transaction_webclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDependencies extends InheritedWidget {
  final ContactDao contactDao;
  final TransactionWebClient webClient;

  AppDependencies({
    required this.contactDao,
    required this.webClient,
    required Widget child,
  }) : super(child: child);

  static AppDependencies of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDependencies>()!;

  @override
  bool updateShouldNotify(AppDependencies oldWidget) =>
      contactDao != oldWidget.contactDao || webClient != oldWidget.webClient;
}
