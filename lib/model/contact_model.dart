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

  ContactModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'accountNumber': accountNumber,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          accountNumber == other.accountNumber;

  @override
  int get hashCode => name.hashCode ^ accountNumber.hashCode;
}
