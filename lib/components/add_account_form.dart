import 'package:flutter/material.dart';

class AddAccountForm extends StatefulWidget {
  @override
  _AddAccountFormState createState() => _AddAccountFormState();
}

class _AddAccountFormState extends State<AddAccountForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text("Account Name:"),
          ),
          TextFormField(
            validator: (value) {
              if(value.isEmpty) {
                return "Please give name for this account!";
              }
            }
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text("Login Name (Username/e-Mail):"),
          ),
          TextFormField(
            validator: (value) {
              if(value.isEmpty) {
                return "Please fill your login Info!";
              }
            }
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text("Password:"),
          ),
          Row(
            children: <Widget> [
              Expanded(
		child: TextFormField(
		  validator: (value) {
		    if(value.isEmpty) {
		      return "Please fill your login Info!";
		    }
		  }
		)
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
		child: RaisedButton(
		  child: Text("Generate"),
		  onPressed: () {
		  }
		)
              )
            ]
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0),
            child: RaisedButton(
              child: Text("Add Account"),
              onPressed: () {
                if(_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Adding Your Account, Please Wait...")
                    )
                  );
                }
              },
            )
          )
        ]
      )
    );
  }
}
