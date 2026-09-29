import 'package:flutter/material.dart';

class ConnectAutoAutomaticConnectionPreview extends StatefulWidget {
  const ConnectAutoAutomaticConnectionPreview({super.key});

  @override
  State<ConnectAutoAutomaticConnectionPreview> createState() =>
      _ConnectAutoAutomaticConnectionPreviewState();
}

class _ConnectAutoAutomaticConnectionPreviewState
    extends State<ConnectAutoAutomaticConnectionPreview> {
  static const _navy = Color(0xFF14299F);
  static const _blue = Color(0xFF4056D4);
  static const _yellow = Color(0xFFFFD632);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: Stack(
        children: [
          const _AutoPreviewBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _header(),
                  const SizedBox(height: 18),
                  _hero(),
                  const SizedBox(height: 21),
                  _info('Route: Kolkata → Durgapur', accent: _yellow, bold: true),
                  _info('Rules matched: destination + carrier'),
                  _info('Excluded: 2 holds · 1 dispute'),
                  _info('Estimated departure: 6:30 PM'),
                  const SizedBox(height: 25),
                  _createButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() => Container(
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 9),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: const [BoxShadow(color: Color(0x160D1D68), blurRadius: 9, offset: Offset(0, 4))]),
        child: Row(children: [
          Container(width: 34, height: 34, decoration: const BoxDecoration(color: _yellow, shape: BoxShape.circle), child: const Icon(Icons.chevron_left, color: Color(0xFF17276D))),
          const SizedBox(width: 11),
          const Expanded(child: Text('Automatic connection preview', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black))),
          Container(width: 37, height: 4, decoration: BoxDecoration(color: _yellow, borderRadius: BorderRadius.circular(2))),
        ]),
      );

  Widget _hero() => Container(
        height: 86,
        padding: const EdgeInsets.fromLTRB(20, 15, 18, 12),
        decoration: BoxDecoration(gradient: const LinearGradient(colors: [_navy, _blue]), borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Color(0x331D2A9A), blurRadius: 9, offset: Offset(0, 5))]),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('24 orders ready to connect', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
          SizedBox(height: 8),
          Text('Live data · auditable actions only', style: TextStyle(color: Colors.white, fontSize: 10)),
        ]),
      );

  Widget _info(String text, {Color accent = _navy, bool bold = false}) => Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(color: const Color(0xF7F9FCFF), borderRadius: BorderRadius.circular(15), border: Border.all(color: const Color(0xDDE0E8F4))),
        child: Row(children: [
          Container(width: 4, height: 50, decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 14),
          Text(text, style: TextStyle(color: const Color(0xFF263B70), fontSize: 13, fontWeight: bold ? FontWeight.w800 : FontWeight.w500)),
        ]),
      );

  Widget _createButton() => Container(
        height: 52,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(gradient: const LinearGradient(colors: [_navy, _blue]), borderRadius: BorderRadius.circular(16), boxShadow: const [BoxShadow(color: Color(0x35203097), blurRadius: 10, offset: Offset(0, 5))]),
        child: Row(children: [
          Container(width: 4, height: 28, margin: const EdgeInsets.only(left: 16), decoration: BoxDecoration(color: _yellow, borderRadius: BorderRadius.circular(2))),
          const Expanded(child: Center(child: Text('Create automatic connection', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800)))),
          const Padding(padding: EdgeInsets.only(right: 18), child: Icon(Icons.chevron_right, color: _yellow, size: 27)),
        ]),
      );
}

class _AutoPreviewBackground extends StatelessWidget {
  const _AutoPreviewBackground();
  @override
  Widget build(BuildContext context) => IgnorePointer(child: Stack(children: [
        Positioned(top: -70, right: -42, child: Container(width: 132, height: 132, decoration: const BoxDecoration(color: Color(0xFFE8EDFF), shape: BoxShape.circle))),
        Positioned(top: 398, left: -37, child: Container(width: 100, height: 100, decoration: const BoxDecoration(color: Color(0xFFFFF4BF), shape: BoxShape.circle))),
        Positioned(bottom: 10, left: 28, child: Container(width: 40, height: 40, decoration: const BoxDecoration(color: Color(0xFFE4F5F1), shape: BoxShape.circle))),
      ]));
}
