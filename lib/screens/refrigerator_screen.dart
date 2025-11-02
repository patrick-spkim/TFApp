import 'package:flutter/material.dart';

class RefrigeratorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('냉장고 리스트'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/milk.jpg'),
              title: Text('우유 200ml(3개)'),
              subtitle: Text('D-1 -26.08.01'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/banana.jpg'),
              title: Text('고당도 바나나'),
              subtitle: Text('D-3 -26.08.03'),
            ),
          ),
          // 다른 항목들도 비슷하게 추가
        ],
      ),
    );
  }
}