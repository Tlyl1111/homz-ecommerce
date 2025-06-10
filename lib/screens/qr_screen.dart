import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/utils/app_routes.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';
import 'package:timberr/widgets/custom_app_bar.dart';

import '../models/product.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<StatefulWidget> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _hasPermission = status.isGranted;
    });

    if (!status.isGranted) {
      _showPermissionDeniedDialog();
    }
  }

  void _showPermissionDeniedDialog() {
    if (mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Camera Permission Required'),
          content: const Text(
            'This feature requires camera access to scan QR codes. Please grant camera permission in your device settings.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Open Settings'),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
          ],
        ),
      );
    }
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _hasPermission
          ? Stack(
              children: <Widget>[
                // QR Scanner view
                _buildQrView(context),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: CustomButton(
                      height: 48,
                      onTap: _scanQRFromImage,
                      child: const Text('Choose Image'),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.camera_alt_outlined,
                    size: 72,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Camera permission required',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'This feature needs camera access to scan QR codes',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    height: 48,
                    onTap: _requestCameraPermission,
                    child: const Text('Grant Permission',
                        style: TextStyle(fontFamily: 'Poppins')),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      _handleScanResult(scanData.code);
    });
  }

  _handleScanResult(String? qrCode) async {
    if (qrCode == null || qrCode.isEmpty) {
      return;
    }
    final response =
        await Supabase.instance.client.from("Products").select().eq(
              "product_id",
              qrCode,
            );
    final responseList = response;
    debugPrint(responseList.toString());
    if (responseList.isNotEmpty) {
      Get.offNamed(AppRoutes.product,
          arguments: Product.fromJson(responseList[0]));
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    setState(() {
      _hasPermission = p;
    });

    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No permission to access camera')),
      );
      _showPermissionDeniedDialog();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _scanQRFromImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      String? result = await Scan.parse(pickedFile.path);
      debugPrint("Result Scan: $result");
      _handleScanResult(result);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
