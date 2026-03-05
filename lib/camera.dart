import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MyCameraApp extends StatelessWidget {
  const MyCameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QRScanOnlyPage(
        onDetected: (value) {
          debugPrint('QRコードの値: $value');
        },
      ),
    );
  }
}

class QRScanOnlyPage extends StatefulWidget {
  const QRScanOnlyPage({super.key, required this.onDetected});

  final void Function(String value) onDetected;

  @override
  State<QRScanOnlyPage> createState() => _QRScanOnlyPageState();
}

class _QRScanOnlyPageState extends State<QRScanOnlyPage> {
  bool _detected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        onDetect: (capture) {
          if (_detected) return;

          final barcode = capture.barcodes.first;
          final value = barcode.rawValue;

          if (value != null) {
            _detected = true;
            widget.onDetected(value);
          }
        },
      ),
    );
  }
}
