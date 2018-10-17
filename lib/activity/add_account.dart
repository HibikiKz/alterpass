import 'package:flutter/material.dart';
import '../components/add_account_form.dart';

class AddAccountActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("Add Account Activity"),
      appBar: AppBar(
        title: Text("Add New Account")
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AddAccountForm()
        )
      )
    );
  }
}
