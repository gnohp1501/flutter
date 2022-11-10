class Transaction {
  String content;
  double amount;

  //constructor
  Transaction({required this.content, required this.amount});

  @override
  String toString() {
    return '${content} -- ${amount.toString()}';
  }
}
