import 'package:flutter/material.dart';

import 'TransactionList.dart';
import 'transaction.dart';

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> with WidgetsBindingObserver {
  String _stateContent = '';
  double _stateAmount = 0;
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  //
  Transaction _transaction = Transaction(content: "", amount: 0.0);
  List<Transaction> _transactions = <Transaction>[];

  //
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("initState");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        {
          print("pause");
        }
        break;

      case AppLifecycleState.resumed:
        {
          print("resumed");
        }
        break;

      case AppLifecycleState.inactive:
        {
          print("inactive");
        }
        break;

      case AppLifecycleState.detached:
        {
          print("detached");
        }
        break;

      default:
        {}
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "123",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.add))
          ],
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _contentController,
                    onChanged: (text) {
                      setState(() {
                        _transaction.content = text;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Content'),
                  ),
                  TextField(
                    controller: _amountController,
                    onChanged: (text) {
                      setState(() {
                        _transaction.amount = double.tryParse(text) ?? 0;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Amount'),
                  ),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amberAccent)),
                      onPressed: () {
                        if (_contentController.text == "" &&
                            _amountController.text == "") return;
                        setState(() {
                          _transactions.add(_transaction);
                          _transaction = Transaction(content: "", amount: 0.0);
                          _contentController.text = "";
                          _amountController.text = "";
                        });
                      },
                      child: const Text('Insert Transaction',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.pinkAccent))),
                  TransactionList(transactions: _transactions),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
