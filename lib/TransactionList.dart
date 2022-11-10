import 'package:flutter/material.dart';
import 'package:learn_flutter/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  ListView _listTransaction() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color:
                (transactions[index].amount > 10) ? Colors.pink : Colors.green,
            elevation: 10,
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
              title: Text(
                transactions[index].content,
                style: (const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              subtitle: Text(
                transactions[index].amount.toString(),
                style: (const TextStyle(color: Colors.white)),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return Column(children: _listTransaction());
    return SizedBox(
      height: 500,
      child: _listTransaction(),
    );
  }
}
