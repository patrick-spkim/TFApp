// lib/screens/refrigerator_detail_screen.dart
import 'package:flutter/material.dart';

class RefrigeratorDetailScreen extends StatelessWidget {
  const RefrigeratorDetailScreen({super.key});

  final List<Map<String, String>> items = const [
    {'name': '우유 200ml(3개)', 'date': 'D-1', 'exp': '~26.08.01'},
    {'name': '고당도 바나나', 'date': 'D-3', 'exp': '~26.08.03'},
    {'name': '하림 치킨너겟', 'date': 'D-21', 'exp': '~26.08.21'},
    {'name': '생크림빵', 'date': 'D-3', 'exp': '~26.08.25'},
    {'name': '녹차 팩', 'date': 'D-67', 'exp': '~26.10.21'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주방 냉장고'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.person_outline), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // 요약 카드
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('재고 요약', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('12개 상품 보관중', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    _buildStatus('기한 임박 2개', Colors.orange),
                    const SizedBox(height: 8),
                    _buildStatus('임박 활용 Ai레시피 추천', Colors.red),
                  ],
                ),
              ],
            ),
          ),

          // 탭
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _TabButton(text: '전체', isActive: true),
                _TabButton(text: '임박', isActive: false),
                _TabButton(text: '마감', isActive: false),
              ],
            ),
          ),

          // 상품 리스트
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    // 수정: ClipRRect로 감싸서 borderRadius 적용
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.grey[300],
                      ),
                    ),
                    title: Text(
                      item['name']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('${item['date']} ${item['exp']}'),
                  ),
                );
              },
            ),
          ),

          // + 상품 추가 버튼
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007AFF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('+ 상품 추가', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatus(String text, Color color) {
    return Row(
      children: [
        Container(width: 8, height: 8, color: color),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

// 탭 버튼 위젯
class _TabButton extends StatelessWidget {
  final String text;
  final bool isActive;
  const _TabButton({required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}