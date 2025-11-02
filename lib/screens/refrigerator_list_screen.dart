// lib/screens/refrigerator_list_screen.dart
import 'package:flutter/material.dart';
import 'refrigerator_detail_screen.dart';

class RefrigeratorListScreen extends StatelessWidget {
  const RefrigeratorListScreen({super.key});

  final List<Map<String, dynamic>> refrigerators = const [
    {
      'name': '주방·냉장고',
      'items': 12,
      'price': 5,
      'imminent': 2,
      'color': Color(0xFFFFD700), // 노란색
      'icon': Icons.kitchen,
    },
    {
      'name': '미니 냉장고',
      'items': 1,
      'price': 1,
      'imminent': 0,
      'color': Color(0xFF007AFF), // 파란색
      'icon': Icons.ac_unit,
    },
    {
      'name': '화장품 냉장고',
      'items': 24,
      'price': 5,
      'imminent': 3,
      'color': Color(0xFF34C759), // 초록색
      'icon': Icons.spa,
    },
    {
      'name': '지하실 냉장고',
      'items': 31,
      'price': 11,
      'imminent': 4,
      'color': Color(0xFFFF9500), // 주황색
      'icon': Icons.inventory_2,
    },
    {
      'name': '피자집 1호점',
      'items': 64,
      'price': 23,
      'imminent': 6,
      'color': Color(0xFFAF52DE), // 보라색
      'icon': Icons.local_pizza,
    },
    {
      'name': '피자집 2호점',
      'items': 75,
      'price': 21,
      'imminent': 8,
      'color': Color(0xFF8E8E93), // 회색
      'icon': Icons.store,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('냉장고 리스트'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.person_outline), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // 냉장고 리스트
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.55, // 오버플로우 방지
              ),
              itemCount: refrigerators.length,
              itemBuilder: (context, index) {
                final fridge = refrigerators[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RefrigeratorDetailScreen()),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: fridge['color'],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 상단: 아이콘 + 이름 + 더보기
                        Row(
                          children: [
                            Icon(fridge['icon'], color: Colors.white, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                fridge['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis, // 오버플로우 방지
                              ),
                            ),
                            const Icon(Icons.more_horiz, color: Colors.white, size: 20),
                          ],
                        ),
                        const Spacer(),

                        // 중간: 상품 수
                        Text(
                          '${fridge['items']}개 상품 보관중',
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(height: 4),

                        // 하단: 임박 + 금액
                        Row(
                          children: [
                            if (fridge['imminent'] > 0)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '임박 상품 ${fridge['imminent']}개',
                                  style: const TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              ),
                            const Spacer(),
                            Row(
                              children: [
                                const Icon(Icons.attach_money, color: Colors.white, size: 16),
                                Text(
                                  '${fridge['price']}',
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // + 냉장고 추가 버튼
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007AFF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('+ 냉장고 추가', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}