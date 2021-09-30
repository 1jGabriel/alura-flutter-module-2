import 'package:bloc/bloc.dart';
import 'package:bytebank/network/webclients/transaction_webclient.dart';
import 'package:bytebank/screens/name.dart';
import 'package:bytebank/theme.dart';
import 'package:bytebank/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';

import 'database/contact_dao.dart';

void main() {
  runApp(BytebankApp(
    contactDao: ContactDao(),
    webClient: TransactionWebClient(),
  ));
}

class BytebankApp extends StatelessWidget {
  final ContactDao contactDao;
  final TransactionWebClient webClient;

  BytebankApp({required this.contactDao, required this.webClient});

  @override
  Widget build(BuildContext context) {
    Bloc.observer = LogObserver();
    return AppDependencies(
      contactDao: contactDao,
      webClient: webClient,
      child: MaterialApp(
        theme: bytebankTheme,
        home: NameContainer(),
      ),
    );
  }
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} : $change');
    super.onChange(bloc, change);
  }
}
