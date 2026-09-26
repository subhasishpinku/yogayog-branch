import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanLabelAwbScanAbelPrinting extends StatefulWidget {
  const ScanLabelAwbScanAbelPrinting({super.key});

  @override
  State<ScanLabelAwbScanAbelPrinting> createState() =>
      _ScanLabelAwbScanAbelPrintingState();
}

class _ScanLabelAwbScanAbelPrintingState
    extends State<ScanLabelAwbScanAbelPrinting> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'awb_scanner');
  final TextEditingController _awbController = TextEditingController();
  QRViewController? _qrController;
  bool _hasScanned = false;

  @override
  void dispose() {
    _qrController?.dispose();
    _awbController.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      final code = scanData.code?.trim();
      if (!mounted || code == null || code.isEmpty || _hasScanned) return;

      setState(() {
        _hasScanned = true;
        _awbController.text = code;
      });
      controller.pauseCamera();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('AWB scanned successfully')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: SafeArea(
        child: Stack(
          children: [
            const _BackgroundDecorations(),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 9, 10, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 32),
                  _ScannerPreview(
                    qrKey: _qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                  const SizedBox(height: 17),
                  const Text(
                    'Align AWB barcode or QR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF11131B),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Scan to open shipment and printing options.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF53617C),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'MANUAL AWB ENTRY',
                      style: TextStyle(
                        color: Color(0xFF52617D),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  _buildAwbField(),
                  const SizedBox(height: 44),
                  _buildActionButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A263D70),
            blurRadius: 14,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 9),
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD52F),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chevron_left,
                color: Color(0xFF152040),
                size: 19,
              ),
            ),
          ),
          const SizedBox(width: 11),
          const Text(
            'AWB scan and label printing',
            style: TextStyle(
              color: Color(0xFF0F1119),
              fontSize: 19,
              fontWeight: FontWeight.w800,
              letterSpacing: .1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAwbField() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14263D70),
            blurRadius: 13,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: TextField(
        controller: _awbController,
        textInputAction: TextInputAction.done,
        style: const TextStyle(
          color: Color(0xFF13203B),
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
        decoration: const InputDecoration(
          hintText: 'e.g. YYG-240918',
          hintStyle: TextStyle(
            color: Color(0xFF13203B),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return Container(
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF17277B), Color(0xFF3C4ED1)],
        ),
        borderRadius: BorderRadius.circular(17),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33273C9F),
            blurRadius: 13,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 27,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD000),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const Expanded(
            child: Text(
              'Find and open shipment',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(
              Icons.chevron_right,
              color: Color(0xFFFFD000),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScannerPreview extends StatelessWidget {
  const _ScannerPreview({required this.qrKey, required this.onQRViewCreated});

  final GlobalKey qrKey;
  final QRViewCreatedCallback onQRViewCreated;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 334 / 342,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: const Color(0xFF151922),
          borderRadius: BorderRadius.circular(22),
        ),
        child: QRView(
          key: qrKey,
          onQRViewCreated: onQRViewCreated,
          formatsAllowed: const [
            BarcodeFormat.qrcode,
            BarcodeFormat.code128,
            BarcodeFormat.code39,
            BarcodeFormat.code93,
            BarcodeFormat.ean13,
            BarcodeFormat.ean8,
            BarcodeFormat.upcA,
            BarcodeFormat.upcE,
            BarcodeFormat.codabar,
            BarcodeFormat.itf,
          ],
          overlay: QrScannerOverlayShape(
            overlayColor: const Color(0xB3151922),
            borderColor: const Color(0xFFFFD000),
            borderRadius: 0,
            borderLength: 31,
            borderWidth: 4,
            cutOutSize: 244,
          ),
          onPermissionSet: (controller, granted) {
            if (!granted && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Camera permission is required to scan.'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class _ScannerPainter extends CustomPainter {
  const _ScannerPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final yellow = Paint()
      ..color = const Color(0xFFFFD000)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;

    const corner = 31.0;
    const inset = 44.0;
    final right = size.width - inset;
    final bottom = size.height - inset;

    canvas.drawLine(
      const Offset(inset, inset),
      const Offset(inset + corner, inset),
      yellow,
    );
    canvas.drawLine(
      const Offset(inset, inset),
      const Offset(inset, inset + corner),
      yellow,
    );
    canvas.drawLine(
      Offset(right, inset),
      Offset(right - corner, inset),
      yellow,
    );
    canvas.drawLine(
      Offset(right, inset),
      Offset(right, inset + corner),
      yellow,
    );
    canvas.drawLine(
      Offset(inset, bottom),
      Offset(inset + corner, bottom),
      yellow,
    );
    canvas.drawLine(
      Offset(inset, bottom),
      Offset(inset, bottom - corner),
      yellow,
    );
    canvas.drawLine(
      Offset(right, bottom),
      Offset(right - corner, bottom),
      yellow,
    );
    canvas.drawLine(
      Offset(right, bottom),
      Offset(right, bottom - corner),
      yellow,
    );

    final barcodeRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(56, size.height * .29, size.width - 112, 108),
      const Radius.circular(10),
    );
    canvas.drawRRect(barcodeRect, Paint()..color = const Color(0xFF252B38));

    final white = Paint()
      ..color = const Color(0xFFF7F8FF)
      ..strokeWidth = 3;
    final barTop = size.height * .33;
    final barBottom = size.height * .53;
    for (var i = 0; i < 12; i++) {
      final x = 72.0 + i * 16.1;
      canvas.drawLine(Offset(x, barTop), Offset(x, barBottom), white);
    }

    final scanLine = Paint()
      ..color = const Color(0xFFFF3F4E)
      ..strokeWidth = 1.5;
    canvas.drawLine(
      Offset(64, size.height * .445),
      Offset(size.width - 64, size.height * .445),
      scanLine,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BackgroundDecorations extends StatelessWidget {
  const _BackgroundDecorations();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -61,
            right: -47,
            child: Container(
              width: 145,
              height: 145,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE8ECFF).withValues(alpha: .76),
              ),
            ),
          ),
          Positioned(
            top: 22,
            right: -39,
            child: Container(
              width: 105,
              height: 105,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFDDE4FF), width: 16),
              ),
            ),
          ),
          Positioned(
            left: -40,
            bottom: 238,
            child: Container(
              width: 98,
              height: 98,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFEFA8).withValues(alpha: .65),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
