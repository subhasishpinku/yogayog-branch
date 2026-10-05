import 'package:flutter/material.dart';

class ClaimsClaimsHandling extends StatefulWidget {
  const ClaimsClaimsHandling({super.key});

  @override
  State<ClaimsClaimsHandling> createState() => _ClaimsClaimsHandlingState();
}

class _ClaimsClaimsHandlingState extends State<ClaimsClaimsHandling> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _ClaimsBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(11, 4, 11, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 14),
                  _buildField('AWB / order'),
                  _buildField('Claim category'),
                  _buildField('Claimed amount'),
                  _buildField('Incident narrative', height: 50),
                  _buildField('Evidence attachments', height: 50),
                  const SizedBox(height: 33),
                  _buildSubmitButton(),
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
          const Text(
            'Claims handling',
            style: TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
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

  Widget _buildField(String label, {double height = 50}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1, bottom: 7),
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF42557D),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x160D1D68),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      height: 53,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF263694), Color(0xFF4059D2)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(17),
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
                'Submit claim for approval',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 19),
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
}

class _ClaimsBackground extends StatelessWidget {
  const _ClaimsBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
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
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            top: 392,
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
}
