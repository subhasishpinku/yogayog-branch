import 'package:flutter/material.dart';
import 'package:yogayogbranch/otpScreen/otp_screen.dart';

class BranchLogin extends StatefulWidget {
  const BranchLogin({super.key});

  @override
  State<BranchLogin> createState() => _BranchLoginState();
}

class _BranchLoginState extends State<BranchLogin> {
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    _passwordController.dispose();
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
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 12),
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
                  top: -80,
                  right: -54,
                  child: _circle(180, const Color(0xFFE8ECFF)),
                ),
                Positioned(
                  top: 23,
                  right: -15,
                  child: _circle(110, const Color(0xFFDDE4FF)),
                ),
                Positioned(
                  top: height * 0.47,
                  left: -48,
                  child: _circle(100, const Color(0xFFFFF3BE)),
                ),
                Positioned(
                  bottom: 105,
                  left: 23,
                  child: _circle(36, const Color(0xFFE5F6F1)),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    width * 0.075,
                    50,
                    width * 0.075,
                    32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/yogayoglogo.png',
                          width: width * 0.29,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 43),
                      const Text(
                        'Branch operations login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF0B0D13),
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          height: 1.05,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Role-based access for authorized staff',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4B5A7B),
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 42),
                      _fieldLabel('Registered mobile / user ID'),
                      const SizedBox(height: 7),
                      _inputField(
                        controller: _mobileController,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      _fieldLabel('Password'),
                      const SizedBox(height: 7),
                      _inputField(
                        controller: _passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 43),
                      SizedBox(
                        height: 47,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF26369E), Color(0xFF4058DA)],
                            ),
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFF26369E,
                                ).withValues(alpha: 0.28),
                                blurRadius: 10,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const OtpScreen(),
                                ),
                              );
                            },
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
                                    'Sign in securely',
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
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Forgot password? Contact branch administrator',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF18399B),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
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

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF33456D),
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB9C3DF).withValues(alpha: 0.33),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
