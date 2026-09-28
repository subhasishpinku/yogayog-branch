import 'package:flutter/material.dart';

class RiderMapLiveRiderPickupMap extends StatefulWidget {
  const RiderMapLiveRiderPickupMap({super.key});

  @override
  State<RiderMapLiveRiderPickupMap> createState() =>
      _RiderMapLiveRiderPickupMapState();
}

class _RiderMapLiveRiderPickupMapState
    extends State<RiderMapLiveRiderPickupMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EEF5),
      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(size: Size.infinite, painter: _MapGridPainter()),
            Positioned(top: 16, left: 18, right: 18, child: _mapHeader()),
            Positioned(left: 49, bottom: 210, child: _pin('A', const Color(0xFF16A16D))),
            Positioned(left: 190, bottom: 402, child: _pin('S', const Color(0xFFF28A0A))),
            Positioned(right: 27, top: 82, child: _pin('R', const Color(0xFFE8414B))),
            Positioned(left: 18, right: 18, bottom: 16, child: _bottomCard()),
          ],
        ),
      ),
    );
  }

  Widget _mapHeader() => Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: const [BoxShadow(color: Color(0x241A2B61), blurRadius: 10, offset: Offset(0, 5))]),
        alignment: Alignment.centerLeft,
        child: const Text('3 riders · 5 active jobs · live branch view', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700)),
      );

  Widget _pin(String text, Color color) => Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4)),
        alignment: Alignment.center,
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
      );

  Widget _bottomCard() => Container(
        height: 159,
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(19), boxShadow: const [BoxShadow(color: Color(0x241A2B61), blurRadius: 10, offset: Offset(0, 5))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Operational map', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            const Text('Arjun: pickup complete · 3.8 km to drop', style: TextStyle(color: Color(0xFF16A16D), fontSize: 10, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            const Text('Suman: offline · last seen 18 min ago', style: TextStyle(color: Color(0xFFF28A0A), fontSize: 10, fontWeight: FontWeight.w600)),
            const Spacer(),
            Container(
              height: 51,
              decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF14299F), Color(0xFF4056D4)]), borderRadius: BorderRadius.circular(15)),
              child: Row(children: [
                Container(width: 4, height: 28, margin: const EdgeInsets.only(left: 16), decoration: BoxDecoration(color: const Color(0xFFFFD632), borderRadius: BorderRadius.circular(2))),
                const Expanded(child: Center(child: Text('Open assignment queue', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800)))),
                const Padding(padding: EdgeInsets.only(right: 18), child: Icon(Icons.chevron_right, color: Color(0xFFFFD632), size: 27)),
              ]),
            ),
          ],
        ),
      );
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()..color = const Color(0xFFD0DAE4)..strokeWidth = 5;
    for (var x = -100.0; x < size.width + 150; x += 102) {
      canvas.drawLine(Offset(x, 0), Offset(x - 28, size.height), grid);
    }
    for (var y = 20.0; y < size.height; y += 105) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y - 35), grid);
    }
    final route = Paint()..color = const Color(0xFF243DAF)..strokeWidth = 7..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    final path = Path()..moveTo(64, size.height - 225)..cubicTo(120, size.height - 285, 110, size.height - 395, 204, size.height - 445)..cubicTo(270, size.height - 485, 292, size.height - 565, 330, 90);
    canvas.drawPath(path, route);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
