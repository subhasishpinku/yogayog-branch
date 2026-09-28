import 'package:flutter/material.dart';

class ConnectManualConnectShipmentManually extends StatefulWidget {
  const ConnectManualConnectShipmentManually({super.key});

  @override
  State<ConnectManualConnectShipmentManually> createState() =>
      _ConnectManualConnectShipmentManuallyState();
}

class _ConnectManualConnectShipmentManuallyState
    extends State<ConnectManualConnectShipmentManually> {
  static const _navy = Color(0xFF14299F);
  static const _yellow = Color(0xFFFFD632);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: Stack(
        children: [
          const _ConnectBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(21, 8, 10, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _header(),
                  const SizedBox(height: 8),
                  _field('AWB number'),
                  _field('Destination branch'),
                  _field('Route / vehicle'),
                  _field('Manifest reference'),
                  _field('Connection remarks'),
                  const SizedBox(height: 23),
                  _connectButton(),
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
            'Connect shipment manually',
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

  Widget _field(String label) => Padding(
    padding: const EdgeInsets.only(bottom: 11),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF52678F),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Color(0x120D1D68),
                blurRadius: 9,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _connectButton() => Container(
    height: 52,
    margin: const EdgeInsets.only(right: 8),
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
              'Connect shipment',
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
  );
}

class _ConnectBackground extends StatelessWidget {
  const _ConnectBackground();
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
          top: 390,
          left: -45,
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF1B5),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -18,
          left: 21,
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
