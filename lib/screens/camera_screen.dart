import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: const BackButton(color: Colors.white),
        actions: [
          IconButton(icon: const Icon(Icons.flash_on, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.sync, color: Colors.white), onPressed: () {}),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          Container(color: Colors.black),
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Text(
              '가이드 라인에 맞춰\n인식해주세요',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: const Text('바코드', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: CircleAvatar(radius: 35, backgroundColor: Colors.grey),
          ),
        ],
      ),
    );
  }
}