import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BottomBarApp extends StatefulWidget {
	const BottomBarApp({super.key});

	@override
	State<BottomBarApp> createState() => _BottomBarAppState();
}

class _BottomBarAppState extends State<BottomBarApp> {
	int _currentIndex = 0;

	final List<Widget> _pages = const [
		_HomeScreen(),
		_CameraScreen(),
		_ListScreen(),
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: IndexedStack(
				index: _currentIndex,
				children: _pages,
			),
			bottomNavigationBar: BottomNavigationBar(
				currentIndex: _currentIndex,
				onTap: (index) {
					setState(() {
						_currentIndex = index;
					});
				},
				selectedItemColor: const Color(0xFFB31212),
				unselectedItemColor: Colors.grey,
				items: const [
					BottomNavigationBarItem(
						icon: Icon(Icons.home),
						label: 'ホーム',
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.photo_camera),
						label: 'カメラ',
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.list),
						label: 'リスト',
					),
				],
			),
		);
	}
}

class _HomeScreen extends StatelessWidget {
	const _HomeScreen();

	@override
	Widget build(BuildContext context) {
		return const Scaffold(
			body: Center(
				child: Text(
					'ホーム画面',
					style: TextStyle(fontSize: 24),
				),
			),
		);
	}
}

class _CameraScreen extends StatefulWidget {
	const _CameraScreen();

	@override
	State<_CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<_CameraScreen> {
	String? _detectedValue;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Stack(
				children: [
					MobileScanner(
						onDetect: (capture) {
							final value = capture.barcodes.first.rawValue;
							if (value == null) {
								return;
							}

							if (_detectedValue != value) {
								setState(() {
									_detectedValue = value;
								});
							}
						},
					),
					Positioned(
						left: 16,
						right: 16,
						bottom: 32,
						child: Container(
							padding: const EdgeInsets.all(12),
							decoration: BoxDecoration(
								color: Colors.black.withValues(alpha: 0.6),
								borderRadius: BorderRadius.circular(12),
							),
							child: Text(
								_detectedValue == null
										? 'QRコードを読み取ってください'
										: '検出: $_detectedValue',
								style: const TextStyle(color: Colors.white),
							),
						),
					),
				],
			),
		);
	}
}

class _ListScreen extends StatelessWidget {
	const _ListScreen();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: ListView.separated(
				padding: const EdgeInsets.all(16),
				itemCount: 10,
				separatorBuilder: (_, __) => const SizedBox(height: 8),
				itemBuilder: (context, index) {
					return ListTile(
						leading: const Icon(Icons.check_circle_outline),
						title: Text('リスト項目 ${index + 1}'),
						tileColor: Colors.grey.shade100,
						shape: RoundedRectangleBorder(
							borderRadius: BorderRadius.circular(12),
						),
					);
				},
			),
		);
	}
}
