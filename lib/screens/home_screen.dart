import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> refrigerators = const [
    {
      'title': '주방·냉장고',
      'count': 12,
      'price': 5,
      'color': Color(0xFFFFD700),
      'icon': Icons.kitchen,
    },
    {
      'title': '미니 냉장고',
      'count': 1,
      'price': 1,
      'color': Color(0xFF007AFF),
      'icon': Icons.ac_unit,
    },
    {
      'title': '화장품 냉장고',
      'count': 24,
      'price': 5,
      'color': Color(0xFF34C759),
      'icon': Icons.spa,
    },
    {
      'title': '지하실 냉장고',
      'count': 31,
      'price': 11,
      'color': Color(0xFFFF9500),
      'icon': Icons.inventory_2,
    },
    {
      'title': '피자집 1호점',
      'count': 64,
      'price': 23,
      'color': Color(0xFFAF52DE),
      'icon': Icons.local_pizza,
    },
    {
      'title': '피자집 2호점',
      'count': 75,
      'price': 21,
      'color': Color(0xFF8E8E93),
      'icon': Icons.store,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('냉장고 리스트', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_bag_outlined), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.6,
              ),
              itemCount: refrigerators.length,
              itemBuilder: (context, index) {
                final fridge = refrigerators[index];
                return Container(
                  decoration: BoxDecoration(
                    color: fridge['color'],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(fridge['icon'], color: Colors.white, size: 20),
                            const Spacer(),
                            const Icon(Icons.more_horiz, color: Colors.white),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '${fridge['count']}개 상품 보관중',
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.attach_money, color: Colors.white, size: 16),
                            Text(
                              '${fridge['price']}',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          fridge['title'],
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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