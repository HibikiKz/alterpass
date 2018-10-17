import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'add_account.dart';
import 'settings.dart';

enum AppBarActionMenu { add, settings, about }

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  List<String> listItems = [];
  Widget _scaffoldBody;

  @override
  Widget build(BuildContext context) {

    if(listItems.length > 0) {
      _scaffoldBody = ListView.builder(
	itemCount: listItems.length,
	itemBuilder: (BuildContext context, int index) {
	  return Card(
	    child: Column(
	      children: <Widget> [
		ListTile(
		  leading: Icon(Icons.apps),
		  title: Text(listItems[index])
		)
	      ]
	    )
	  );
	}
      );
    } else {
      _scaffoldBody = Center(
        child: Column(
	  mainAxisAlignment: MainAxisAlignment.center,
	  crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Icon(Icons.assignment, size: 160.0),
            Text("Oops, seems like your list still empty!"),
            Text("Let's add some of your account here by clicking '+' button below.")
          ]
        )
      );
    }


    return Scaffold(
      key: Key("Home Scaffold"),
      appBar: AppBar(
        title: Text(
          'AlterPass',
          style: Theme.of(context).primaryTextTheme.title,
        ),
	actions: <Widget> [
	  IconButton(
	    icon: Icon(Icons.search),
	    tooltip: 'Search Account',
	    onPressed: () {
	      print("Pressing Search");
	    }
	  ),
          PopupMenuButton(
            onSelected: (AppBarActionMenu selected) {
              if(selected == AppBarActionMenu.add) {
	       Navigator.push(
	 	 context,
		 CupertinoPageRoute(builder: (context) => AddAccountActivity())
	       );
              } else if (selected == AppBarActionMenu.settings) {
	       Navigator.push(
	 	 context,
		 CupertinoPageRoute(builder: (context) => SettingsActivity())
	       );
              } else if (selected == AppBarActionMenu.about) {
                showDialog(
                  context: context,
                  child: SimpleDialog(
                    contentPadding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
                    children: <Widget> [
                      Image.asset(
                        'assets/images/ap_logo.png',
                        fit: BoxFit.fitWidth
                      ),
                    ]
                  )
                );
              }
            },
            itemBuilder: (BuildContext context) =>  <PopupMenuEntry<AppBarActionMenu>> [
              const PopupMenuItem<AppBarActionMenu>(
                value: AppBarActionMenu.add,
                child: Text("Add Account")
              ),
              const PopupMenuItem<AppBarActionMenu>(
                value: AppBarActionMenu.settings,
                child: Text("Settings")
              ),
              const PopupMenuItem<AppBarActionMenu>(
                value: AppBarActionMenu.about,
                child: Text("About AlterPass")
              ),
            ]
          )
	]
      ),
      body: _scaffoldBody, 
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Account",
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => AddAccountActivity())
          );
        }
      ),
    );
  }
}
