import 'package:flutter/material.dart';
import '../servicedetailserviceorderdetail/servicedetailserviceorderdetail.dart';

class ServiceOrdersBikeTruckServiceOrders extends StatefulWidget {
  const ServiceOrdersBikeTruckServiceOrders({super.key});

  @override
  State<ServiceOrdersBikeTruckServiceOrders> createState() =>
      _ServiceOrdersBikeTruckServiceOrdersState();
}

class _ServiceOrdersBikeTruckServiceOrdersState
    extends State<ServiceOrdersBikeTruckServiceOrders> {
  static const _navy = Color(0xFF12259A);
  static const _yellow = Color(0xFFFFD632);
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _ServiceOrdersBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(7, 8, 7, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 17),
                  _buildSearchField(),
                  const SizedBox(height: 24),
                  _buildOrderCard(
                    orderId: 'BT-24091',
                    details: 'Bike · 4.8 km · ₹120',
                    status: 'AVAILABLE',
                    accent: _navy,
                    iconBackground: const Color(0xFFE1E6F8),
                    statusBackground: const Color(0xFFDCE2F5),
                  ),
                  _buildOrderCard(
                    orderId: 'TR-24044',
                    details: 'Truck · 62 km · ₹840',
                    status: 'ASSIGNED',
                    accent: _navy,
                    iconBackground: const Color(0xFFE1E6F8),
                    statusBackground: const Color(0xFFDCE2F5),
                    iconText: 'T',
                  ),
                  _buildOrderCard(
                    orderId: 'BT-24076',
                    details: 'Bike · Pickup overdue',
                    status: 'LATE',
                    accent: const Color(0xFFE8414B),
                    iconBackground: const Color(0xFFF8E3E5),
                    statusBackground: const Color(0xFFF5E1E5),
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
          const Expanded(
            child: Text(
              'Bike and truck service orders',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 27,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8D7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'Filter',
                style: TextStyle(
                  color: _navy,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(left: 23, right: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x120D1D68),
            blurRadius: 9,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Search and filter records',
              style: TextStyle(color: Color(0xFF71809E), fontSize: 12),
            ),
          ),
          Container(
            height: 28,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8D7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                '3 shown',
                style: TextStyle(
                  color: _navy,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required String orderId,
    required String details,
    required String status,
    required Color accent,
    required Color iconBackground,
    required Color statusBackground,
    String iconText = 'B',
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ServiceDetailServiceOrderDetail(),
          ),
        );
      },
      child: Container(
      height: 74,
      margin: const EdgeInsets.only(bottom: 9, left: 4, right: 4),
      decoration: BoxDecoration(
        color: const Color(0xFAF9FBFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xDDE0E8F4)),
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 74,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 9),
          Container(
            width: 31,
            height: 31,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                iconText,
                style: TextStyle(
                  color: accent,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
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
                  orderId,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  details,
                  style: const TextStyle(
                    color: Color(0xFF52678F),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 76,
            height: 27,
            margin: const EdgeInsets.only(right: 17),
            decoration: BoxDecoration(
              color: statusBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                status,
                style: TextStyle(
                  color: accent,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class _ServiceOrdersBackground extends StatelessWidget {
  const _ServiceOrdersBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -50,
            right: -35,
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
            top: 385,
            left: -46,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF1B5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -18,
            left: 21,
            child: Container(
              width: 42,
              height: 42,
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
