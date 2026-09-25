import 'package:flutter/material.dart';

class ProvisionCustomerCredentials extends StatefulWidget {
  const ProvisionCustomerCredentials({super.key});

  @override
  State<ProvisionCustomerCredentials> createState() =>
      _ProvisionCustomerCredentialsState();
}

class _ProvisionCustomerCredentialsState
    extends State<ProvisionCustomerCredentials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFB),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            return Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 12, 8),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xFFF6F8FF),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(22),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFB9C3DF).withValues(alpha: 0.32),
                    blurRadius: 18,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -55,
                    right: -45,
                    child: _circle(145, const Color(0xFFE8ECFF)),
                  ),
                  Positioned(
                    top: 22,
                    right: -14,
                    child: _circle(90, const Color(0xFFDDE4FF)),
                  ),
                  Positioned(
                    top: height * 0.48,
                    left: -45,
                    child: _circle(100, const Color(0xFFFFF3BE)),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(10, 6, 14, 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(width),
                        const SizedBox(height: 13),
                        _buildCreatedBanner(),
                        const SizedBox(height: 18),
                        _statusRow(
                          'Login phone: +91 98••• ••210',
                          const Color(0xFFFFC800),
                          isBold: true,
                        ),
                        const SizedBox(height: 6),
                        _statusRow(
                          'OTP verification: Completed',
                          const Color(0xFF2639A8),
                        ),
                        const SizedBox(height: 6),
                        _statusRow(
                          'Temporary password: Not used',
                          const Color(0xFF2639A8),
                        ),
                        const SizedBox(height: 6),
                        _statusRow(
                          'Welcome message: Ready',
                          const Color(0xFF2639A8),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 18,
                    right: 18,
                    bottom: 18,
                    child: _buildActionButton(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(double width) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB9C3DF).withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 31,
            height: 31,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD43B),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              '‹',
              style: TextStyle(
                color: Color(0xFF16358E),
                fontSize: 21,
                height: 0.8,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Provision customer credentials',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF0B0D13),
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            width: 34,
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

  Widget _buildCreatedBanner() {
    return Container(
      height: 78,
      padding: const EdgeInsets.fromLTRB(15, 14, 10, 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF26369E), Color(0xFF4058DA)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF26369E).withValues(alpha: 0.26),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer created: CUS-10482',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Live data · auditable actions only',
            style: TextStyle(color: Colors.white, fontSize: 9),
          ),
        ],
      ),
    );
  }

  Widget _statusRow(String text, Color accent, {bool isBold = false}) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFF),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFFDDE3F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 45,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: isBold ? const Color(0xFF0B0D13) : const Color(0xFF4B5A7B),
              fontSize: 11,
              fontWeight: isBold ? FontWeight.w800 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return SizedBox(
      height: 47,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF26369E), Color(0xFF4058DA)],
          ),
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF26369E).withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 25,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD000),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const Expanded(
                child: Text(
                  'Send secure login instructions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Text(
                '›',
                style: TextStyle(
                  color: Color(0xFFFFD000),
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  height: 0.7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circle(double size, Color color) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
