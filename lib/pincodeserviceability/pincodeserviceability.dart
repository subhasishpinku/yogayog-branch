import 'package:flutter/material.dart';

class PinCodeSerViceability extends StatefulWidget {
  const PinCodeSerViceability({super.key});

  @override
  State<PinCodeSerViceability> createState() => _PinCodeSerViceabilityState();
}

class _PinCodeSerViceabilityState extends State<PinCodeSerViceability> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _PincodeBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 4, 10, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'Check origin or destination pincode',
                      style: TextStyle(color: Color(0xFF42557D), fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 17),
                  _buildSearchField(),
                  const SizedBox(height: 25),
                  _buildCheckButton(),
                  const SizedBox(height: 26),
                  _buildRecentHeader(),
                  const SizedBox(height: 13),
                  _buildRecentRow(
                    'Y',
                    'YYG-240918',
                    'In transit · Riya Sen',
                    'LIVE',
                    const Color(0xFF2939B4),
                    const Color(0xFFE4E8FA),
                  ),
                  const SizedBox(height: 10),
                  _buildRecentRow(
                    'Y',
                    'YYG-240871',
                    'Ready to ship · Saha Traders',
                    'READY',
                    const Color(0xFF16A16D),
                    const Color(0xFFE1F3ED),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 57,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: const [
          BoxShadow(
            color: Color(0x180D1D68),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD632),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.chevron_left,
              size: 20,
              color: Color(0xFF17276D),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Pincode serviceability',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            width: 38,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFFFC800),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x160D1D68),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF6D2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.pin_drop_outlined,
              size: 17,
              color: Color(0xFF2939B4),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Enter AWB / reference / mobile',
            style: TextStyle(color: Color(0xFF71809E), fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckButton() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF263694), Color(0xFF4059D2)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x302339A1),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 28,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD000),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Check serviceability',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18),
            child: Text(
              '›',
              style: TextStyle(
                color: Color(0xFFFFD000),
                fontSize: 27,
                fontWeight: FontWeight.w800,
                height: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentHeader() {
    return Row(
      children: [
        Container(
          width: 5,
          height: 23,
          decoration: BoxDecoration(
            color: const Color(0xFFFFC800),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 9),
        const Text(
          'Recent searches',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentRow(
    String iconLabel,
    String reference,
    String details,
    String status,
    Color accent,
    Color iconBackground,
  ) {
    return Container(
      height: 74,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBFF).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDCE3F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              iconLabel,
              style: TextStyle(
                color: accent,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reference,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  details,
                  style: const TextStyle(color: Color(0xFF52678F), fontSize: 9),
                ),
              ],
            ),
          ),
          Container(
            width: 76,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: accent,
                fontSize: 9,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PincodeBackground extends StatelessWidget {
  const _PincodeBackground();
  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: Stack(
      children: [
        Positioned(
          top: -53,
          right: -24,
          child: Container(
            width: 130,
            height: 180,
            decoration: const BoxDecoration(
              color: Color(0xFFE9EDFF),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
            ),
          ),
        ),
        Positioned(
          top: 390,
          left: -49,
          child: Container(
            width: 97,
            height: 97,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF1B5),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 11,
          left: 17,
          child: Container(
            width: 40,
            height: 40,
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
