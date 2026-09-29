import 'package:flutter/material.dart';

class ReadyToShipReadyToShipQueue extends StatefulWidget {
  const ReadyToShipReadyToShipQueue({super.key});

  @override
  State<ReadyToShipReadyToShipQueue> createState() =>
      _ReadyToShipReadyToShipQueueState();
}

class _ReadyToShipReadyToShipQueueState
    extends State<ReadyToShipReadyToShipQueue> {
  static const _navy = Color(0xFF12259A);
  static const _yellow = Color(0xFFFFD632);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: Stack(children: [
        const _ReadyShipBackground(),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(7, 8, 7, 24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              _header(),
              const SizedBox(height: 17),
              _searchField(),
              const SizedBox(height: 24),
              _orderCard('YYG-240918', 'Label ready · Rider pending', 'ASSIGN', _navy, const Color(0xFFE1E6F8), const Color(0xFFDCE2F5)),
              _orderCard('YYG-240871', 'Manifest MF-08', 'READY', const Color(0xFF16A16D), const Color(0xFFE0F3ED), const Color(0xFFDCEFEA)),
              _orderCard('YYG-240802', 'Document missing', 'HOLD', const Color(0xFFE8414B), const Color(0xFFF8E3E5), const Color(0xFFF5E1E5)),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget _header() => Container(height: 57, padding: const EdgeInsets.symmetric(horizontal: 9), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: const [BoxShadow(color: Color(0x160D1D68), blurRadius: 9, offset: Offset(0, 4))]), child: Row(children: [Container(width: 34, height: 34, decoration: const BoxDecoration(color: _yellow, shape: BoxShape.circle), child: const Icon(Icons.chevron_left, color: Color(0xFF17276D))), const SizedBox(width: 11), const Expanded(child: Text('Ready-to-ship queue', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black))), Container(height: 27, padding: const EdgeInsets.symmetric(horizontal: 17), decoration: BoxDecoration(color: const Color(0xFFFFF8D7), borderRadius: BorderRadius.circular(15)), child: const Center(child: Text('Filter', style: TextStyle(color: _navy, fontSize: 10, fontWeight: FontWeight.w700))))]));

  Widget _searchField() => Container(height: 45, padding: const EdgeInsets.only(left: 23, right: 9), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: const [BoxShadow(color: Color(0x120D1D68), blurRadius: 9, offset: Offset(0, 4))]), child: Row(children: [const Expanded(child: Text('Search and filter records', style: TextStyle(color: Color(0xFF71809E), fontSize: 12))), Container(height: 28, padding: const EdgeInsets.symmetric(horizontal: 17), decoration: BoxDecoration(color: const Color(0xFFFFF8D7), borderRadius: BorderRadius.circular(16)), child: const Center(child: Text('3 shown', style: TextStyle(color: _navy, fontSize: 10, fontWeight: FontWeight.w800))))]));

  Widget _orderCard(String id, String details, String status, Color accent, Color iconBackground, Color statusBackground) => Container(height: 74, margin: const EdgeInsets.only(bottom: 9, left: 4, right: 4), decoration: BoxDecoration(color: const Color(0xFAF9FBFF), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xDDE0E8F4))), child: Row(children: [Container(width: 5, height: 74, decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(3))), const SizedBox(width: 9), Container(width: 31, height: 31, decoration: BoxDecoration(color: iconBackground, shape: BoxShape.circle), child: Center(child: Text('Y', style: TextStyle(color: accent, fontSize: 13, fontWeight: FontWeight.w800)))), const SizedBox(width: 14), Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Text(id, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w800)), const SizedBox(height: 6), Text(details, style: const TextStyle(color: Color(0xFF52678F), fontSize: 10, fontWeight: FontWeight.w500))])), Container(width: 76, height: 27, margin: const EdgeInsets.only(right: 17), decoration: BoxDecoration(color: statusBackground, borderRadius: BorderRadius.circular(16)), child: Center(child: Text(status, style: TextStyle(color: accent, fontSize: 10, fontWeight: FontWeight.w800))))]));
}

class _ReadyShipBackground extends StatelessWidget { const _ReadyShipBackground(); @override Widget build(BuildContext context) => IgnorePointer(child: Stack(children: [Positioned(top: -50, right: -35, child: Container(width: 135, height: 135, decoration: const BoxDecoration(color: Color(0xFFE9EDFF), shape: BoxShape.circle))), Positioned(top: 385, left: -46, child: Container(width: 100, height: 100, decoration: const BoxDecoration(color: Color(0xFFFFF1B5), shape: BoxShape.circle))), Positioned(top: 400, right: -35, child: Container(width: 75, height: 75, decoration: const BoxDecoration(color: Color(0xFFFFF1BA), shape: BoxShape.circle))), Positioned(bottom: -18, left: 21, child: Container(width: 42, height: 42, decoration: const BoxDecoration(color: Color(0xFFE3F5F0), shape: BoxShape.circle)))])); }
