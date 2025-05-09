class Account {
  final int id;
  final String name;
  final String accountNumber;
  final int balance;
  final String currency;

  Account({
    required this.id,
    required this.name,
    required this.accountNumber,
    required this.balance,
    required this.currency,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    id: json['id'],
    name: json['name'],
    accountNumber: json['accountNumber'],
    balance: json['balance'],
    currency: json['currency'],
  );
}
