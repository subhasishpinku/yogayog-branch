import 'package:flutter/material.dart';

class BranchProfile extends StatefulWidget {
  const BranchProfile({super.key});

  @override
  State<BranchProfile> createState() => _BranchProfileState();
}

class _BranchProfileState extends State<BranchProfile> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _BranchProfileBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 19),
                  _buildBranchBanner(),
                  const SizedBox(height: 21),
                  _buildInfoRow(
                    'Manager: Priya Sen',
                    const Color(0xFFFFC800),
                    true,
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    'Address: Sector V, Kolkata 700091',
                    const Color(0xFF2939B4),
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    'Primary phone: +91 33 4000 1122',
                    const Color(0xFF2939B4),
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    'Operating hours: 9 AM - 8 PM',
                    const Color(0xFF2939B4),
                  ),
                  const SizedBox(height: 31),
                  _buildActionButton(),
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
            'Branch profile',
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

  Widget _buildBranchBanner() {
    return Container(
      height: 86,
      padding: const EdgeInsets.fromLTRB(21, 16, 16, 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF263694), Color(0xFF4059D2)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x252339A1),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -17,
            child: Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                color: Color(0x182F4CC4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Salt Lake Branch · BR-0018',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 9),
              Text(
                'Live data · auditable actions only',
                style: TextStyle(
                  color: Color(0xFFE5EAFF),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Positioned(
            left: -21,
            top: 0,
            bottom: 0,
            child: Container(
              width: 7,
              decoration: BoxDecoration(
                color: const Color(0xFFFFD000),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String text, Color accent, [bool bold = false]) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBFF).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDCE3F0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(width: 4, color: accent),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                  color: bold ? Colors.black : const Color(0xFF42557D),
                  fontSize: 13,
                  fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return Container(
      height: 53,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF263694), Color(0xFF4059D2)],
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
                'Edit permitted information',
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
}

class _BranchProfileBackground extends StatelessWidget {
  const _BranchProfileBackground();
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
