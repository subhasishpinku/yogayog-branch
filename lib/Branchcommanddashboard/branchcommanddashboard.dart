import 'package:flutter/material.dart';

class BranchCommandDashboard extends StatefulWidget {
  const BranchCommandDashboard({super.key});

  @override
  State<BranchCommandDashboard> createState() => _BranchCommandDashboardState();
}

class _BranchCommandDashboardState extends State<BranchCommandDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 12),
              _buildLiveOperations(),
              const SizedBox(height: 18),
              _buildStats(),
              const SizedBox(height: 13),
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 21,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC800),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Operational attention',
                      style: TextStyle(
                        color: Color(0xFF0B0D13),
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFFF5CF),
                      foregroundColor: const Color(0xFF102681),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      minimumSize: const Size(0, 28),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'View queues',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _attentionCard(
                color: const Color(0xFFFF9E1B),
                icon: '₱',
                title: 'Pickup requests',
                subtitle: '12 waiting • 3 overdue',
                action: 'ACTION',
              ),
              const SizedBox(height: 10),
              _attentionCard(
                color: const Color(0xFF7654D9),
                icon: '₹',
                title: 'COD to reconcile',
                subtitle: '₹8,420 with riders',
                action: 'MONEY',
              ),
              const SizedBox(height: 10),
              _attentionCard(
                color: const Color(0xFFE83D49),
                icon: '!',
                title: 'Exceptions',
                subtitle: '7 weight • 3 claims',
                action: 'HIGH',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Image.asset(
          'assets/images/yogayoglogo.png',
          width: 91,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 9),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Salt Lake Branch',
                style: TextStyle(color: Color(0xFF33456D), fontSize: 10),
              ),
              SizedBox(height: 3),
              Text(
                'Good morning, Priya',
                style: TextStyle(
                  color: Color(0xFF0B0D13),
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: const Color(0xFFFFD43B),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          alignment: Alignment.center,
          child: const Text(
            'N',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLiveOperations() {
    return Container(
      height: 78,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF26369E), Color(0xFF4058DA)],
        ),
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF26369E).withValues(alpha: 0.24),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TODAY · LIVE OPERATIONS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '₹1,84,260 booking value',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Positioned(
            top: 15,
            right: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD43B),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text(
                'SYNCED',
                style: TextStyle(
                  color: Color(0xFF0B0D13),
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 13,
      mainAxisSpacing: 12,
      childAspectRatio: 1.65,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _StatCard(value: '284', label: 'All orders', color: Color(0xFF283BAA)),
        _StatCard(value: '42', label: 'Pending', color: Color(0xFFF28A17)),
        _StatCard(value: '96', label: 'In transit', color: Color(0xFF29A9D2)),
        _StatCard(value: '138', label: 'Delivered', color: Color(0xFF20A26B)),
      ],
    );
  }

  Widget _attentionCard({
    required Color color,
    required String icon,
    required String title,
    required String subtitle,
    required String action,
  }) {
    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFF),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFDDE3F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 68,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.13),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              icon,
              style: TextStyle(color: color, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF0B0D13),
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(color: Color(0xFF4B5A7B), fontSize: 9),
                ),
              ],
            ),
          ),
          Container(
            width: 68,
            height: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.11),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              action,
              style: TextStyle(
                color: color,
                fontSize: 9,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
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

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.value,
    required this.label,
    required this.color,
  });

  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 10, 10, 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFF),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFDDE3F0)),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 5,
              height: 76,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF0B0D13),
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  label,
                  style: const TextStyle(color: Color(0xFF4B5A7B), fontSize: 9),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.13),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
