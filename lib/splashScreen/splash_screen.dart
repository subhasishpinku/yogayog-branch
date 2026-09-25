import 'package:flutter/material.dart';
import '../branchLogin/branch_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final Animation<double> _logoFade;
  late final Animation<double> _logoScale;
  late final AnimationController _progressController;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    final curve = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOutBack,
    );
    _logoFade = CurvedAnimation(parent: _logoController, curve: Curves.easeIn);
    _logoScale = Tween<double>(begin: 0.65, end: 1).animate(curve);
    _logoController.forward();

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _progress = CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    );
    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const BranchLogin()),
        );
      }
    });
    _progressController.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _progressController.dispose();
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
            margin: const EdgeInsets.fromLTRB(0, 0, 16, 16),
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
                  top: -92,
                  right: -68,
                  child: _circle(190, const Color(0xFFE8ECFF)),
                ),
                Positioned(
                  top: 32,
                  right: -18,
                  child: _circle(110, const Color(0xFFDDE4FF)),
                ),
                Positioned(
                  top: height * 0.25,
                  left: width * 0.245,
                  child: _circle(174, const Color(0xFFFFF7D8)),
                ),
                Positioned(
                  top: height * 0.49,
                  left: -42,
                  child: _circle(100, const Color(0xFFFFF3BE)),
                ),
                Positioned(
                  bottom: 106,
                  left: 27,
                  child: _circle(36, const Color(0xFFE5F6F1)),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.335,
                      left: width * 0.1,
                      right: width * 0.5,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeTransition(
                          opacity: _logoFade,
                          child: ScaleTransition(
                            scale: _logoScale,
                            child: Image.asset(
                              'assets/images/yogayoglogo.png',
                              width: width * 0.29,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 70),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.430),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'BRANCH',
                          style: TextStyle(
                            color: Color(0xFF071D78),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Operations connected end to end',
                          style: TextStyle(
                            color: Color(0xFF33456D),
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 70),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 130,
                  left: width * 0.32,
                  child: SizedBox(
                    width: width * 0.36,
                    height: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: AnimatedBuilder(
                        animation: _progress,
                        builder: (context, child) {
                          return LinearProgressIndicator(
                            value: _progress.value,
                            backgroundColor: const Color(0xFFE2E6EF),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFFFC800),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
