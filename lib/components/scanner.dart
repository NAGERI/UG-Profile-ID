import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

class Scanner extends StatefulWidget {
  Scanner({Key key}) : super(key: key);
  static String id = 'Scanner screen';

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  GlobalKey qrKey = GlobalKey();
  var qrText = '';
  QRViewController controller;
  void _onQRViewCreate(QRViewController qrViewController) {
    this.controller = qrViewController;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                borderRadius: 10.0,
                borderWidth: 10.0,
                borderLength: 30.0,
                cutOutSize: 250.0,
                borderColor: Colors.white,
              ),
              onQRViewCreated: _onQRViewCreate,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('The scanned account is for: $qrText'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
