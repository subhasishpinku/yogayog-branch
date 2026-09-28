import 'package:flutter/material.dart';
import '../trackingshipmenttrackingtimeline/trackingshipmenttrackingtimeline.dart';

class ShipmentDetailCompleteShipmentDetail extends StatefulWidget {
  const ShipmentDetailCompleteShipmentDetail({super.key});

  @override
  State<ShipmentDetailCompleteShipmentDetail> createState() =>
      _ShipmentDetailCompleteShipmentDetailState();
}

class _ShipmentDetailCompleteShipmentDetailState
    extends State<ShipmentDetailCompleteShipmentDetail> {
  static const _navy = Color(0xFF10258F);
  static const _blue = Color(0xFF3B51D0);
  static const _yellow = Color(0xFFFFD632);
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _BackgroundDecoration(),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(14, 8, 14, 25),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 33,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 18),
                        _buildShipmentSummary(),
                        const SizedBox(height: 21),
                        _buildOperationalActions(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
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
            child: const Icon(
              Icons.chevron_left,
              size: 20,
              color: Color(0xFF17276D),
            ),
          ),
          const SizedBox(width: 11),
          const Text(
            'Complete shipment detail',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          const Spacer(),
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
  }

  Widget _buildShipmentSummary() {
    return Column(
      children: [
        Container(
          height: 86,
          padding: const EdgeInsets.fromLTRB(20, 15, 18, 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [_navy, _blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x331D2A9A),
                blurRadius: 9,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#YYG-240918 · In Transit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Live data · auditable actions only',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 21),
        _infoRow('Customer: Riya Sen', accent: _yellow, bold: true),
        _infoRow('Salt Lake → New Town'),
        _infoRow('2 pieces · 2.4 kg'),
        _infoRow('₹1,850 COD · Payment pending'),
      ],
    );
  }

  Widget _infoRow(String text, {Color accent = _navy, bool bold = false}) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        color: const Color(0xF7F9FCFF),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xDDE0E8F4)),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 50,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 14),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF263B70),
              fontSize: 13,
              fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOperationalActions() {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const TrackingShipmentTrackingTimeline(),
          ),
        );
      },
      child: Container(
        height: 52,
        margin: const EdgeInsets.symmetric(horizontal: 8),
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
                  'Open operational actions',
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
      ),
    );
  }
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -70,
            right: -42,
            child: Container(
              width: 132,
              height: 132,
              decoration: const BoxDecoration(
                color: Color(0xFFE8EDFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 398,
            left: -37,
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
            bottom: 25,
            left: 28,
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
}
