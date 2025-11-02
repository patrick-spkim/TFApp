// lib/screens/my_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'expense_detail_screen.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY'),
        actions: [IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 50, backgroundColor: Colors.grey),
          const SizedBox(height: 12),
          const Text('홍길동님', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMyItem(Icons.receipt, '주문 내역'),
              _buildMyItem(Icons.credit_card, '저장 레시피'),
              _buildMyItem(Icons.alarm, '최근 본 레시피'),
              _buildMyItem(Icons.headset_mic, '1:1 문의'),
            ],
          ),
          const SizedBox(height: 32),

          _buildExpenseCard(context),
          const SizedBox(height: 24),

          _buildMenuItem(Icons.inventory, '주문내역'),
          _buildMenuItem(Icons.shopping_bag, '장바구니'),
          _buildMenuItem(Icons.favorite_border, '찜한 상품'),
          _buildMenuItem(Icons.auto_awesome, 'AI 추천상품'),
          const Divider(),
          _buildMenuItem(Icons.build, '앱 설정'),
          _buildMenuItem(Icons.place, '내 주소 설정'),

          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('로그아웃', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMyItem(IconData icon, String label) {
    return Column(children: [Icon(icon), const SizedBox(height: 4), Text(label, style: const TextStyle(fontSize: 12))]);
  }

  Widget _buildExpenseCard(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.receipt_long, color: Colors.blue),
        title: const Text('소비내역 가계부'),
        subtitle: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExpenseDetailScreen())),
          child: const Text(
            '7월 전체내역 19,000원 | 7%',
            style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExpenseDetailScreen())),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(leading: Icon(icon), title: Text(title), trailing: const Icon(Icons.chevron_right), onTap: () {});
  }
}