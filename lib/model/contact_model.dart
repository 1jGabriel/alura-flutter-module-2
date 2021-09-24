class ContactModel {
  final int id;
  final String name;
  final int accountNumber;

  ContactModel(
    this.id,
    this.name,
    this.accountNumber,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'accountNumber': accountNumber,
    };
  }

  @override
  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber}';
  }
}
