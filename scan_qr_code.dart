import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrResults = 'Scanned Data will appear here';

  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ADD8E6', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        qrResults = qrCode;
      });
    } on PlatformException {
      setState(() {
        qrResults = 'Failed to read QR Code';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              '$qrResults',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: scanQR, child: Text('Scan Code'))
          ],
        ),
      ),
    );
  }
}
