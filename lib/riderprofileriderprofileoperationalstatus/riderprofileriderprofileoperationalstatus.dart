import 'package:flutter/material.dart';
import '../ridereditcreateeditrider/ridereditcreateeditrider.dart';

class RiderProfileRiderProfileOperationalStatus extends StatefulWidget {
  const RiderProfileRiderProfileOperationalStatus({super.key});

  @override
  State<RiderProfileRiderProfileOperationalStatus> createState() =>
      _RiderProfileRiderProfileOperationalStatusState();
}

class _RiderProfileRiderProfileOperationalStatusState
    extends State<RiderProfileRiderProfileOperationalStatus> {
  static const _navy = Color(0xFF14299F);
  static const _blue = Color(0xFF4056D4);
  static const _yellow = Color(0xFFFFD632);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFFF5F7FF), body: Stack(children: [
      const _ProfileBackground(),
      SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(14, 8, 14, 24), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _header(), const SizedBox(height: 18), _hero(), const SizedBox(height: 21),
        _info('Internal rider · Bike WB20AX8421', accent: _yellow, bold: true),
        _info('Phone: +91 98••• ••210'), _info('KYC: Verified · Documents valid'), _info('Wallet ₹8,460 · COD held ₹6,420'),
        const SizedBox(height: 25), _viewJobs(),
      ]))),
    ]));
  }

  Widget _header() => Container(height: 58, padding: const EdgeInsets.symmetric(horizontal: 9), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: const [BoxShadow(color: Color(0x160D1D68), blurRadius: 9, offset: Offset(0, 4))]), child: Row(children: [Container(width: 34, height: 34, decoration: const BoxDecoration(color: _yellow, shape: BoxShape.circle), child: const Icon(Icons.chevron_left, color: Color(0xFF17276D))), const SizedBox(width: 11), const Expanded(child: Text('Rider profile and operational status', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black))), Container(width: 37, height: 4, decoration: BoxDecoration(color: _yellow, borderRadius: BorderRadius.circular(2)))]));

  Widget _hero() => Container(height: 86, padding: const EdgeInsets.fromLTRB(20, 15, 18, 12), decoration: BoxDecoration(gradient: const LinearGradient(colors: [_navy, _blue]), borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Color(0x331D2A9A), blurRadius: 9, offset: Offset(0, 5))]), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Arjun Kumar · RID-00142', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)), SizedBox(height: 8), Text('Live data · auditable actions only', style: TextStyle(color: Colors.white, fontSize: 10))]));

  Widget _info(String text, {Color accent = _navy, bool bold = false}) => Container(height: 50, margin: const EdgeInsets.only(bottom: 7), decoration: BoxDecoration(color: const Color(0xF7F9FCFF), borderRadius: BorderRadius.circular(15), border: Border.all(color: const Color(0xDDE0E8F4))), child: Row(children: [Container(width: 4, height: 50, decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(2))), const SizedBox(width: 14), Text(text, style: TextStyle(color: const Color(0xFF263B70), fontSize: 13, fontWeight: bold ? FontWeight.w800 : FontWeight.w500))]));

  Widget _viewJobs() => InkWell(borderRadius: BorderRadius.circular(16), onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RiderEditCreateEditRider())), child: Container(height: 52, margin: const EdgeInsets.symmetric(horizontal: 8), decoration: BoxDecoration(gradient: const LinearGradient(colors: [_navy, _blue]), borderRadius: BorderRadius.circular(16), boxShadow: const [BoxShadow(color: Color(0x35203097), blurRadius: 10, offset: Offset(0, 5))]), child: Row(children: [Container(width: 4, height: 28, margin: const EdgeInsets.only(left: 16), decoration: BoxDecoration(color: _yellow, borderRadius: BorderRadius.circular(2))), const Expanded(child: Center(child: Text('View jobs and commission', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800)))), const Padding(padding: EdgeInsets.only(right: 18), child: Icon(Icons.chevron_right, color: _yellow, size: 27))])));
}

class _ProfileBackground extends StatelessWidget { const _ProfileBackground(); @override Widget build(BuildContext context) => IgnorePointer(child: Stack(children: [Positioned(top: -70, right: -42, child: Container(width: 132, height: 132, decoration: const BoxDecoration(color: Color(0xFFE8EDFF), shape: BoxShape.circle))), Positioned(top: 398, left: -37, child: Container(width: 100, height: 100, decoration: const BoxDecoration(color: Color(0xFFFFF4BF), shape: BoxShape.circle))), Positioned(top: 405, right: -35, child: Container(width: 75, height: 75, decoration: const BoxDecoration(color: Color(0xFFFFF1BA), shape: BoxShape.circle))), Positioned(bottom: 10, left: 28, child: Container(width: 40, height: 40, decoration: const BoxDecoration(color: Color(0xFFE4F5F1), shape: BoxShape.circle)))])); }
