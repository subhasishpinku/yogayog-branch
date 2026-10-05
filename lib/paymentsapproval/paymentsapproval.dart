import 'package:flutter/material.dart';

class PaymentsApproval extends StatefulWidget {
  const PaymentsApproval({super.key});

  @override
  State<PaymentsApproval> createState() => _PaymentsApprovalState();
}

class _PaymentsApprovalState extends State<PaymentsApproval> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _PaymentsBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(13, 4, 13, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  _buildSearchBar(),
                  const SizedBox(height: 24),
                  _buildPaymentRow(
                    'P',
                    'PAY-240918',
                    'BillDesk · ₹1,850',
                    'SUCCESS',
                    const Color(0xFF16A16D),
                    const Color(0xFFE1F3ED),
                  ),
                  const SizedBox(height: 10),
                  _buildPaymentRow(
                    'P',
                    'PAY-240871',
                    'Cash · ₹4,680',
                    'APPROVE',
                    const Color(0xFF2939B4),
                    const Color(0xFFE4E8FA),
                  ),
                  const SizedBox(height: 10),
                  _buildPaymentRow(
                    'P',
                    'PAY-240802',
                    'UPI callback delayed',
                    'PENDING',
                    const Color(0xFFED8612),
                    const Color(0xFFFBEEDC),
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
          const Expanded(
            child: Text(
              'Payments and approval',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            height: 28,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF5CA),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'Filter',
                style: TextStyle(
                  color: Color(0xFF12259A),
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

  Widget _buildSearchBar() {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(left: 24, right: 10),
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
              color: const Color(0xFFFFF5CA),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                '3 shown',
                style: TextStyle(
                  color: Color(0xFF12259A),
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

  Widget _buildPaymentRow(
    String iconLabel,
    String reference,
    String details,
    String status,
    Color accent,
    Color iconBackground,
  ) {
    final isSuccess = status == 'SUCCESS';
    final isApprove = status == 'APPROVE';
    return Container(
      height: 74,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBFF).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDCE3F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              iconLabel,
              style: TextStyle(
                color: accent,
                fontSize: 11,
                fontWeight: FontWeight.w800,
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
                  reference,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  details,
                  style: const TextStyle(color: Color(0xFF52678F), fontSize: 9),
                ),
              ],
            ),
          ),
          Container(
            width: 76,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSuccess
                  ? const Color(0xFFDDF0EB)
                  : isApprove
                  ? const Color(0xFFE4E8FA)
                  : const Color(0xFFFBEEDC),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: accent,
                fontSize: 9,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentsBackground extends StatelessWidget {
  const _PaymentsBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
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
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            top: 392,
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
}
