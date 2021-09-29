import 'contact_model.dart';

class Transaction {
  final double value;
  final ContactModel contact;
  final String id;

  Transaction(
    this.value,
    this.contact,
    this.id,
  ) : assert(value > 0);

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

  Transaction.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        value = json['value'],
        contact = ContactModel.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          contact == other.contact;

  @override
  int get hashCode => value.hashCode ^ contact.hashCode;
}
