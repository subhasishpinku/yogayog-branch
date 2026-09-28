import 'package:flutter/material.dart';
import '../assignriderassignridershipment/assignriderassignridershipment.dart';

class RiderEditCreateEditRider extends StatefulWidget {
  const RiderEditCreateEditRider({super.key});

  @override
  State<RiderEditCreateEditRider> createState() =>
      _RiderEditCreateEditRiderState();
}

class _RiderEditCreateEditRiderState extends State<RiderEditCreateEditRider> {
  static const _navy = Color(0xFF14299F);
  static const _yellow = Color(0xFFFFD632);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFFF5F7FF), body: Stack(children: [const _EditBackground(), SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(15, 8, 15, 24), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [_header(), const SizedBox(height: 8), _field('Internal / External rider'), _field('Name and two phones'), _field('Address and branch'), _field('Vehicle and licence'), _field('Bank and commission rule'), const SizedBox(height: 25), _saveButton()])))]));
  }

  Widget _header() => Container(height: 58, padding: const EdgeInsets.symmetric(horizontal: 9), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: const [BoxShadow(color: Color(0x160D1D68), blurRadius: 9, offset: Offset(0, 4))]), child: Row(children: [Container(width: 34, height: 34, decoration: const BoxDecoration(color: _yellow, shape: BoxShape.circle), child: const Icon(Icons.chevron_left, color: Color(0xFF17276D))), const SizedBox(width: 11), const Expanded(child: Text('Create or edit rider', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black))), Container(width: 37, height: 4, decoration: BoxDecoration(color: _yellow, borderRadius: BorderRadius.circular(2)))]));

  Widget _field(String label) => Padding(padding: const EdgeInsets.only(top: 0, bottom: 11), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(color: Color(0xFF52678F), fontSize: 10, fontWeight: FontWeight.w500)), const SizedBox(height: 6), Container(height: 50, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: const [BoxShadow(color: Color(0x120D1D68), blurRadius: 9, offset: Offset(0, 4))]))]));

  Widget _saveButton() => InkWell(borderRadius: BorderRadius.circular(16), onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AssignRiderAssignRiderShipment())), child: Container(height: 52, decoration: BoxDecoration(gradient: const LinearGradient(colors: [_navy, Color(0xFF4056D4)]), borderRadius: BorderRadius.circular(16), boxShadow: const [BoxShadow(color: Color(0x35203097), blurRadius: 10, offset: Offset(0, 5))]), child: Row(children: [Container(width: 4, height: 28, margin: const EdgeInsets.only(left: 16), decoration: BoxDecoration(color: _yellow, borderRadius: BorderRadius.circular(2))), const Expanded(child: Center(child: Text('Save rider and request KYC', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800)))), const Padding(padding: EdgeInsets.only(right: 18), child: Icon(Icons.chevron_right, color: _yellow, size: 27))])));
}

class _EditBackground extends StatelessWidget { const _EditBackground(); @override Widget build(BuildContext context) => IgnorePointer(child: Stack(children: [Positioned(top: -50, right: -35, child: Container(width: 135, height: 135, decoration: const BoxDecoration(color: Color(0xFFE9EDFF), shape: BoxShape.circle))), Positioned(top: 390, left: -45, child: Container(width: 100, height: 100, decoration: const BoxDecoration(color: Color(0xFFFFF1B5), shape: BoxShape.circle))), Positioned(bottom: -18, left: 21, child: Container(width: 42, height: 42, decoration: const BoxDecoration(color: Color(0xFFE3F5F0), shape: BoxShape.circle)))])); }
