import 'package:bytebank/database/contact_dao.dart';
import 'package:bytebank/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  final ContactDao contactDao;

  ContactForm({required this.contactDao});

  @override
  _ContactFormState createState() => _ContactFormState(contactDao: contactDao);
}

class _ContactFormState extends State<ContactForm> {
  final ContactDao _dao = ContactDao();
  final ContactDao contactDao;

  _ContactFormState({required this.contactDao});

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full name',
              ),
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _accountNumberController,
              decoration: InputDecoration(
                labelText: 'Account number',
              ),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  final String name = _nameController.text;
                  final int? accountNumber =
                      int.tryParse(_accountNumberController.text);
                  final ContactModel newContact =
                      ContactModel(0, name, accountNumber ?? 0);
                  _save(newContact, context);
                },
                child: Text('Create'),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _save(ContactModel newContact, BuildContext context) async {
    await contactDao.save(newContact);
    Navigator.pop(context);
  }
}
