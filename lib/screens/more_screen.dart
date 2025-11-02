import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('더보기'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('설정'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('내 주소 설정'),
          ),
        ],
      ),
    );
  }
}