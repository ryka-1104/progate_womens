import 'package:flutter/material.dart';
import 'package:progate_womens/camera.dart';

class BottomBarApp extends StatefulWidget {
  const BottomBarApp({super.key});

  @override
  State<BottomBarApp> createState() => _BottomBarAppState();
}

class _BottomBarAppState extends State<BottomBarApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    QRScanOnlyPage(onDetected: _onCameraDetected),
    _StampScreen(),
    _SouvenirScreen(),
  ];

  static void _onCameraDetected(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF2D5ACB),
        unselectedItemColor: const Color(0xFF8C939E),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_outlined),
            activeIcon: Icon(Icons.photo_camera),
            label: 'スキャン',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: 'スタンプ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            activeIcon: Icon(Icons.card_giftcard),
            label: 'お土産',
          ),
        ],
      ),
    );
  }
}

class _StampScreen extends StatelessWidget {
  const _StampScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('スタンプ画面（仮）')));
  }
}

class _SouvenirScreen extends StatelessWidget {
  const _SouvenirScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('お土産画面（仮）')));
  }
}
