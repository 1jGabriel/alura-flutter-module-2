import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  const TransactionAuthDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder()
        ),
        obscureText: true,
        maxLength: 4,
        style: TextStyle(
          fontSize: 64,
          letterSpacing: 32
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      ),
      actions: [
        TextButton(
          onPressed: () => debugPrint('clicou botao 1'),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => debugPrint('clicou botao 2'),
          child: Text('Confirm'),
        )
      ],
    );
  }
}
