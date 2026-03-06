import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanOnlyPage extends StatefulWidget {
  const QRScanOnlyPage({super.key, required this.onDetected});

  final void Function(String value) onDetected;

  @override
  State<QRScanOnlyPage> createState() => _QRScanOnlyPageState();
}

class _QRScanOnlyPageState extends State<QRScanOnlyPage> {
  bool _detected = false;
  String? exhibitName;

  /// 仮の展示データ
  final Map<String, String> exhibitMap = {
    "3f9d8c0a-6c54-4b8e-9e21-5f4d1a7c2b13": "クラゲ展示",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              if (_detected) return;

              final barcode = capture.barcodes.first;
              final value = barcode.rawValue;

              if (value != null && exhibitMap.containsKey(value)) {
                setState(() {
                  _detected = true;
                  exhibitName = exhibitMap[value];
                });
                widget.onDetected(value);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('このQRコードは登録されていません。もう一度お試しください。'),
                  ),
                );
              }
            },
          ),

          if (exhibitName != null)
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: Text(
                  "展示: $exhibitName",
                  style: const TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
