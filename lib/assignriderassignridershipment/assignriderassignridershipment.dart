import 'package:flutter/material.dart';
import '../ridermapliveriderpickupmap/ridermapliveriderpickupmap.dart';

class AssignRiderAssignRiderShipment extends StatefulWidget {
  const AssignRiderAssignRiderShipment({super.key});
  @override
  State<AssignRiderAssignRiderShipment> createState() =>
      _AssignRiderAssignRiderShipmentState();
}

class _AssignRiderAssignRiderShipmentState
    extends State<AssignRiderAssignRiderShipment> {
  static const _navy = Color(0xFF14299F);
  static const _yellow = Color(0xFFFFD632);
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFF5F7FF),
    body: Stack(
      children: [
        const _AssignBackground(),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(),
                const SizedBox(height: 25),
                const Text(
                  'Assign rider to shipment',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 19),
                _card('Shipment', 'YYG-240918 · Salt Lake → New Town'),
                _card('Selected rider', 'Arjun Kumar · RID-00142'),
                const SizedBox(height: 35),
                _assignButton(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  Widget _header() => Container(
    height: 58,
    padding: const EdgeInsets.symmetric(horizontal: 9),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: const [
        BoxShadow(
          color: Color(0x160D1D68),
          blurRadius: 9,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: const BoxDecoration(
            color: _yellow,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.chevron_left, color: Color(0xFF17276D)),
        ),
        const SizedBox(width: 11),
        const Expanded(
          child: Text(
            'Assign rider to shipment',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          width: 37,
          height: 4,
          decoration: BoxDecoration(
            color: _yellow,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ),
  );
  Widget _card(String title, String value) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(17),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: const Color(0xDDE0E8F4)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Color(0xFF52678F), fontSize: 10),
        ),
        const SizedBox(height: 7),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF14245F),
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
  );
  Widget _assignButton() => InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () => Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const RiderMapLiveRiderPickupMap()),
    ),
    child: Container(
      height: 52,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [_navy, Color(0xFF4056D4)]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x35203097),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 28,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: _yellow,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Assign selected rider',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(Icons.chevron_right, color: _yellow, size: 27),
          ),
        ],
      ),
    ),
  );
}

class _AssignBackground extends StatelessWidget {
  const _AssignBackground();
  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: Stack(
      children: [
        Positioned(
          top: -50,
          right: -35,
          child: Container(
            width: 135,
            height: 135,
            decoration: const BoxDecoration(
              color: Color(0xFFE9EDFF),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 20,
          child: Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFFE3F5F0),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ),
  );
}
