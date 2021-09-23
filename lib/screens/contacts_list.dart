import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts List'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                'João',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                '1234',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            (MaterialPageRoute(
              builder: (context) => ContactForm(),
            )),
          ).then((value) => debugPrint(value.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
