import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            color: Colors.brown[200],
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              'Cooking Up',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text('Meals'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text('Filter'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/filters');
            },
          )
        ],
      ),
    );
  }
}
