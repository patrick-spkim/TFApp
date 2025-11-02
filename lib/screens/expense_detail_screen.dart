// lib/screens/expense_detail_screen.dart
import 'package:flutter/material.dart';

class ExpenseDetailScreen extends StatelessWidget {
  const ExpenseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('소비내역 가계부'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 월 선택 드롭다운
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('2025.7', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 요약 카드
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('7월 전체내역', style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            // 수정: Colors basi → Colors.green
                            const Text('계획적인 소비, 멋지게 실천 중이에요!', style: TextStyle(color: Colors.green, fontSize: 12)),
                            const SizedBox(width: 4),
                            Icon(Icons.sentiment_satisfied, color: Colors.green, size: 16),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('19,000 원 | 7%', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.07,
                      backgroundColor: Colors.grey[300],
                      color: Colors.yellow,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('절약특가 | 8,000원 절약'),
                        Text('임박소비관리 | 활용률 80%'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 목표 vs 실적
            Card(
              child: ListTile(
                leading: const Icon(Icons.flag, color: Colors.orange),
                title: const Text('7월 목표'),
                subtitle: const Text('25,000원'),
                trailing: const Text('76%', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),

            // 그래프 영역
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text('그래프 영역', style: TextStyle(color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 24),

            // 카테고리별 소비
            const Text('카테고리별 소비', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            _buildCategoryItem('장보기', '카드결제', '-3,400원'),
            _buildCategoryItem('현금', '카드결제', '-4,750원'),
            _buildCategoryItem('식비', '현금결제', '-5,450원'),
            _buildCategoryItem('미용', '카드결제', '-5,450원'),
            const SizedBox(height: 24),

            // + 직접입력
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007AFF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('+ 직접입력', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String category, String method, String amount) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.green[100], child: const Icon(Icons.receipt, color: Colors.green)),
        title: Text(category),
        subtitle: Text(method),
        trailing: Text(amount, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      ),
    );
  }
}