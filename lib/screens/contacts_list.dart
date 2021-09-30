import 'package:bloc/bloc.dart';
import 'package:bytebank/components/container.dart';
import 'package:bytebank/database/contact_dao.dart';
import 'package:bytebank/model/contact_model.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:bytebank/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
abstract class ContactsListState {
  const ContactsListState();
}

@immutable
class InitialContactsListState extends ContactsListState {
  const InitialContactsListState();
}

@immutable
class LoadingContactsListState extends ContactsListState {
  const LoadingContactsListState();
}

@immutable
class LoadedContactsListState extends ContactsListState {
  final List<ContactModel> _contacts;

  const LoadedContactsListState(this._contacts);
}

@immutable
class FatalErrorContactsListState extends ContactsListState {
  const FatalErrorContactsListState() : super();
}

class ContactsListCubit extends Cubit<ContactsListState> {
  ContactsListCubit() : super(InitialContactsListState());

  void reload(ContactDao dao) async {
    emit(LoadingContactsListState());
    dao.findAll().then((value) => emit(LoadedContactsListState(value)));
  }
}

class ContactsListContainer extends BlocContainer {
  final dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactsListCubit>(
      create: (BuildContext context) {
        final cubit = ContactsListCubit();
        cubit.reload(dao);
        return cubit;
      },
      child: ContactsList(),
    );
  }
}

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dependencies = AppDependencies.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tranfer'),
      ),
      body: BlocBuilder<ContactsListCubit, ContactsListState>(
        builder: (context, state) {
          if (state is LoadingContactsListState ||
              state is InitialContactsListState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text('Loading'),
                ],
              ),
            );
          }

          if (state is LoadedContactsListState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final ContactModel contact = state._contacts[index];
                return ContactItem(
                  contact,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TransactionForm(contact),
                      ),
                    );
                  },
                );
              },
              itemCount: state._contacts.length,
            );
          }

          return const Text('Unkown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(
                contactDao: dependencies.contactDao,
              ),
            ),
          );
          updateContacts(context, dependencies);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void updateContacts(BuildContext context, AppDependencies dependencies) {
    context.read<ContactsListCubit>().reload(dependencies.contactDao);
  }
}

class ContactItem extends StatelessWidget {
  final ContactModel contact;
  final Function onClick;

  ContactItem(
    this.contact, {
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
