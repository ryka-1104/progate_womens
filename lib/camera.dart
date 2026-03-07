import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:progate_womens/favorite/favorite_service.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> loadJson() async {
  final data = await rootBundle.loadString('lib/aquarium.json');
  return jsonDecode(data);
}

class QRScanOnlyPage extends StatefulWidget {
  const QRScanOnlyPage({super.key, required this.onDetected});

  final void Function(String value) onDetected;

  @override
  State<QRScanOnlyPage> createState() => _QRScanOnlyPageState();
}

class _QRScanOnlyPageState extends State<QRScanOnlyPage> {
  bool _detected = false;
  String? exhibitName;
  String? exhibitId;

  List<dynamic> exhibits = [];

  @override
  void initState() {
    super.initState();
    loadExhibits();
  }

  Future<void> loadExhibits() async {
    final json = await loadJson();
    if (!mounted) return;
    setState(() {
      exhibits = json["exhibit_attributes"];
    });
  }

  Map<String, dynamic>? findExhibit(String id) {
    for (var exhibit in exhibits) {
      if (exhibit["id"] == id) {
        return exhibit;
      }
    }
    return null;
  }

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

              if (value == null) return;

              final exhibit = findExhibit(value);

              if (exhibit != null) {
                setState(() {
                  _detected = true;
                  exhibitName = exhibit["name"];
                  exhibitId = exhibit["id"];
                });

                widget.onDetected(value);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("このQRコードは登録されていません")),
                );
              }
            },
          ),

          Positioned.fill(
            child: Image.asset(
              "lib/assets/modal_backlog.png",
              fit: BoxFit.cover,
            ),
          ),

          if (exhibitName != null)
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      exhibitName!,
                      style: const TextStyle(color: Colors.white, fontSize: 28),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton.icon(
                      onPressed: () async {
                        if (exhibitId == null) return;

                        await FavoriteService.addFavorite(exhibitId!);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("お気に入りに追加しました")),
                        );
                      },
                      icon: const Icon(Icons.favorite),
                      label: const Text("お気に入り登録"),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
