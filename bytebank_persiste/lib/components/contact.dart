class Contact {
  int id;
  String name;
  final int accountNumber;

  Contact(this.id, this.name, this.accountNumber);

  @override
  String toString() {
    // TODO: implement toString
    return 'Contact {Id: $id, Name: $name, Account Number: $accountNumber}';
  }

}