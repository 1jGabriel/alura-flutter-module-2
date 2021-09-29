import 'package:bytebank/network/webclients/transaction_webclient.dart';
import 'package:bytebank/screens/dashboard.dart';
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
    return AppDependencies(
      contactDao: contactDao,
      webClient: webClient,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Dashboard(contactDao: contactDao),
      ),
    );
  }
}
