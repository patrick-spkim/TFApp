// lib/screens/home_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'refrigerator_list_screen.dart';
import 'expense_detail_screen.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Fresh', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('안녕하세요, 홍길동님', style: TextStyle(fontSize: 16)),
            const Text('오늘의 알림입니다', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 16),

            _buildSummaryCard(context),
            const SizedBox(height: 24),
            _buildExpenseCard(context),
            const SizedBox(height: 24),
            _buildAiRecipeCard(),
            const SizedBox(height: 24),
            _buildShoppingListCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.kitchen, size: 32),
                const SizedBox(width: 12),
                const Text('냉장고', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const Spacer(),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RefrigeratorListScreen())),
                  child: const Text('전체 보기 >'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _summaryItem('총 3개', '보유중'),
                _summaryItem('기한 임박 2개', '주의'),
                _summaryItem('소비 72,000원', '사용'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryItem(String title, String subtitle) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildExpenseCard(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.receipt_long, color: Colors.blue),
        title: const Text('소비내역 가계부'),
        subtitle: const Text('7월 전체내역 19,000원 | 7%'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExpenseDetailScreen())),
      ),
    );
  }

  Widget _buildAiRecipeCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AI 추천 "냉털 레시피" 메뉴', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                _recipeItem('감자전', '감자 1개, 양파 반개'),
                const SizedBox(width: 12),
                _recipeItem('된장찌개', '두부 1모, 애호박'),
                const SizedBox(width: 12),
                _recipeItem('계란 3', '계란 3개'),
              ],
            ),
            const SizedBox(height: 12),
            const Text('지금 주문하면, 타임프레시하게 내일 도착!', style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  Widget _recipeItem(String title, String ingredients) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            const CircleAvatar(radius: 20, backgroundColor: Colors.grey),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(ingredients, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildShoppingListCard() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_cart, color: Colors.green),
        title: const Text('장보기 리스트'),
        subtitle: const Text('우유 1, 바나나 1, 계란 3'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}