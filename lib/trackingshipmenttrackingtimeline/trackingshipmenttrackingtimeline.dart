import 'package:flutter/material.dart';

class TrackingShipmentTrackingTimeline extends StatefulWidget {
  const TrackingShipmentTrackingTimeline({super.key});

  @override
  State<TrackingShipmentTrackingTimeline> createState() =>
      _TrackingShipmentTrackingTimelineState();
}

class _TrackingShipmentTrackingTimelineState
    extends State<TrackingShipmentTrackingTimeline> {
  static const _navy = Color(0xFF131F72);
  static const _yellow = Color(0xFFFFD632);
  static const _green = Color(0xFF18A064);
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _TimelineBackground(),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(9, 5, 9, 25),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 18),
                        _buildShipmentCard(),
                        const SizedBox(height: 29),
                        _buildTimeline(),
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
            'Shipment tracking timeline',
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

  Widget _buildShipmentCard() {
    return Container(
      height: 74,
      padding: const EdgeInsets.fromLTRB(19, 14, 16, 10),
      decoration: BoxDecoration(
        color: _navy,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#YYG-240918',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Salt Lake → New Town · ETA 4:45 PM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    const events = [
      _TimelineEvent('Booking confirmed', '10:08 AM', _green, true),
      _TimelineEvent('Branch processed', '10:42 AM', _green, true),
      _TimelineEvent('Assigned to Arjun', '11:15 AM', _green, true),
      _TimelineEvent('Picked up', '12:05 PM', _green, true),
      _TimelineEvent(
        'Out for delivery',
        '3:18 PM',
        Color(0xFF293EB2),
        true,
        current: true,
      ),
      _TimelineEvent('Delivered', 'Pending', Color(0xFF6D788D), false),
    ];

    return Stack(
      children: [
        Positioned(
          left: 27,
          top: 16,
          bottom: 25,
          child: Container(width: 3, color: const Color(0xFFE4E8F3)),
        ),
        Positioned(
          left: 27,
          top: 16,
          height: 308,
          child: Container(width: 3, color: _green),
        ),
        Column(
          children: [for (final event in events) _buildTimelineEvent(event)],
        ),
      ],
    );
  }

  Widget _buildTimelineEvent(_TimelineEvent event) {
    return SizedBox(
      height: 78,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 55,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: event.color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          event.time,
                          style: const TextStyle(
                            color: Color(0xFF46608D),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (event.current)
                    Container(
                      margin: const EdgeInsets.only(top: 3, right: 14),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7CC),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text(
                        'CURRENT',
                        style: TextStyle(
                          color: _navy,
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineEvent {
  const _TimelineEvent(
    this.title,
    this.time,
    this.color,
    this.completed, {
    this.current = false,
  });

  final String title;
  final String time;
  final Color color;
  final bool completed;
  final bool current;
}

class _TimelineBackground extends StatelessWidget {
  const _TimelineBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -55,
            right: -40,
            child: Container(
              width: 135,
              height: 135,
              decoration: const BoxDecoration(
                color: Color(0xFFE9EDFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 390,
            left: -45,
            child: Container(
              width: 98,
              height: 98,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF4BD),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -16,
            left: 20,
            child: Container(
              width: 43,
              height: 43,
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
