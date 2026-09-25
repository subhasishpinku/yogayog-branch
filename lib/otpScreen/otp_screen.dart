import 'package:flutter/material.dart';
import 'package:yogayogbranch/dashboardScreen/dashboard.dart';
import '../sessiondeviceverification/sessiondeviceverification.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool _isNavigating = false;
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in _otpControllers) {
      controller.dispose();
    }
    for (final focusNode in _otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFB),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 7),
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
                  top: -82,
                  right: -55,
                  child: _circle(180, const Color(0xFFE8ECFF)),
                ),
                Positioned(
                  top: 24,
                  right: -15,
                  child: _circle(110, const Color(0xFFDDE4FF)),
                ),
                Positioned(
                  top: height * 0.48,
                  left: -48,
                  child: _circle(100, const Color(0xFFFFF3BE)),
                ),
                Positioned(
                  bottom: 106,
                  left: 21,
                  child: _circle(36, const Color(0xFFE5F6F1)),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: [
                      _buildHeader(width),
                      SizedBox(height: height * 0.082),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF7D8),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'OTP',
                          style: TextStyle(
                            color: Color(0xFF102681),
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Enter the 4-digit code',
                        style: TextStyle(
                          color: Color(0xFF0B0D13),
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'Sent to +91 98••• ••210',
                        style: TextStyle(
                          color: Color(0xFF4B5A7B),
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildOtpFields(width),
                      const SizedBox(height: 20),
                      const Text(
                        'Resend in 00:24',
                        style: TextStyle(
                          color: Color(0xFF33456D),
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 42),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                        child: _buildActionButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(double width) {
    return Container(
      height: 52,
      margin: EdgeInsets.fromLTRB(width * 0.025, 40, width * 0.025, 15),
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
            child: const Center(
              child: Text(
                '‹',
                style: TextStyle(
                  color: Color(0xFF16358E),
                  fontSize: 21,
                  height: 0.8,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Text(
              'Verify OTP',
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

  Widget _buildOtpFields(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.only(right: index == 3 ? 0 : width * 0.027),
          child: SizedBox(
            width: width * 0.14,
            height: 57,
            child: TextField(
              controller: _otpControllers[index],
              focusNode: _otpFocusNodes[index],
              autofocus: index == 0,
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF0B0D13),
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < 3) {
                  _otpFocusNodes[index + 1].requestFocus();
                } else if (value.isNotEmpty && index == 3) {
                  _openSessionDeviceVerification();
                } else if (value.isEmpty && index > 0) {
                  _otpFocusNodes[index - 1].requestFocus();
                }
              },
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: index < 3
                        ? const Color(0xFFFFC800)
                        : const Color(0xFFE0E5F0),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFFFC800),
                    width: 2,
                  ),
                ),
                suffixIconConstraints: const BoxConstraints.tightFor(),
              ),
            ),
          ),
        );
      }),
    );
  }

  void _openSessionDeviceVerification() {
    if (_isNavigating || !mounted) return;

    _isNavigating = true;
    FocusScope.of(context).unfocus();
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const Dashboard()));
  }

  Widget _buildActionButton() {
    return SizedBox(
      height: 46,
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
                  'Verify and enter branch',
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
