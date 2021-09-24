
import 'contact_model.dart';

class Transaction {
  final double value;
  final ContactModel contact;

  Transaction(
      this.value,
      this.contact,
      );

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}