class ContactModel {
  final String name;
  final int accountNumber;

  ContactModel(
      this.name,
      this.accountNumber,
      );

  @override
  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber}';
  }
}
