import 'package:flutter/material.dart';

class AcceptOrderAcceptRejectServiceOrder extends StatefulWidget {
  const AcceptOrderAcceptRejectServiceOrder({super.key});

  @override
  State<AcceptOrderAcceptRejectServiceOrder> createState() =>
      _AcceptOrderAcceptRejectServiceOrderState();
}

class _AcceptOrderAcceptRejectServiceOrderState
    extends State<AcceptOrderAcceptRejectServiceOrder> {
  static const _navy = Color(0xFF14299F);
  static const _blue = Color(0xFF4056D4);
  static const _yellow = Color(0xFFFFD632);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: Stack(
        children: [
          const _AcceptBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _header(),
                  const SizedBox(height: 48),
                  const Center(
                    child: Text(
                      '!',
                      style: TextStyle(
                        color: Color(0xFFF07D16),
                        fontSize: 43,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),
                  const Center(
                    child: Text(
                      'Accept BT-24091?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 29),
                  _messageCard(),
                  const SizedBox(height: 70),
                  _primaryButton(),
                  const SizedBox(height: 11),
                  _rejectButton(),
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
            'Accept or reject service order',
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

  Widget _messageCard() => Container(
    height: 116,
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),
      boxShadow: const [
        BoxShadow(
          color: Color(0x1A1A2B61),
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The order becomes available for rider assignment in this branch.',
          style: TextStyle(color: Color(0xFF43577E), fontSize: 11),
        ),
        Spacer(),
        Text(
          'Reason and operator identity are stored in audit history.',
          style: TextStyle(color: Color(0xFFE22B2B), fontSize: 10),
        ),
      ],
    ),
  );

  Widget _primaryButton() => Container(
    height: 52,
    decoration: BoxDecoration(
      gradient: const LinearGradient(colors: [_navy, _blue]),
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
              'Accept order',
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

  Widget _rejectButton() => Container(
    height: 54,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: _navy, width: 1.5),
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Color(0x1A1A2B61),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: const Center(
      child: Text(
        'Reject with reason',
        style: TextStyle(
          color: _navy,
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}

class _AcceptBackground extends StatelessWidget {
  const _AcceptBackground();
  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: Stack(
      children: [
        Positioned(
          top: -25,
          right: -45,
          child: Container(
            width: 145,
            height: 145,
            decoration: const BoxDecoration(
              color: Color(0xFFE8EDFF),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 400,
          left: -40,
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF4BF),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 34,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFE4F5F1),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ),
  );
}
