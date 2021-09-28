import 'package:bytebank/model/contact_model.dart';
import 'package:bytebank/model/transaction_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return the value when create a transaction', () {
    final transaction = Transaction(100.0, ContactModel(0, 'abc', 123), 'abc');
    expect(transaction.value, 100.0);
  });

  test('Should show error when create transaction with value less than zero',
      () {
    expect(() => Transaction(0, ContactModel(0, 'abc', 123), 'abc'),
        throwsAssertionError);
  });
}
