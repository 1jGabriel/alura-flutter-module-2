import 'package:bytebank/database/contact_dao.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/name.dart';
import 'package:bytebank/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'transaction_list.dart';

class DashboardContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dependencies = AppDependencies.of(context);
    return BlocProvider(
      create: (_) => NameCubit(''),
      child: DashboardView(
        contactDao: dependencies.contactDao,
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  final ContactDao contactDao;

  DashboardView({required this.contactDao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NameCubit, String>(
          builder: (context, state) =>
              Text('Olá ${context.read<NameCubit>().state}'),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/bytebank_logo.png'),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FeatureItem(
                          'Transfer',
                          Icons.monetization_on,
                          onClick: () {
                            _showContactsList(context);
                          },
                        ),
                        FeatureItem(
                          'Transaction Feed',
                          Icons.description,
                          onClick: () {
                            _showTransactionsList(context);
                          },
                        ),
                        FeatureItem(
                          'Change name',
                          Icons.edit,
                          onClick: () {
                            _showChangeName(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showChangeName(BuildContext blocContext) {
    Navigator.of(blocContext).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: BlocProvider.of<NameCubit>(blocContext),
        child: NameContainer(),
      ),
    ));
  }

  void _showContactsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactsList(),
      ),
    );
  }

  _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  FeatureItem(this.name, this.icon, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          child: GestureDetector(
            onTap: () => onClick.call(),
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Theme.of(context).primaryColor,
              height: 100,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
