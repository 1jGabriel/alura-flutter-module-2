import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/model/contact_model.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final List<ContactModel> contacts = [];

  ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts List'),
      ),
      body: FutureBuilder<List<ContactModel>>(
        initialData: [],
        future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
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
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<ContactModel> contacts = snapshot.data??[];
              return ListView.builder(
                itemBuilder: (context, index) {
                  final ContactModel contact = contacts[index];
                  return ContactItem(contact);
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Text('Unkown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final ContactModel contact;

  ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
