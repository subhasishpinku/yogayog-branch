import 'package:flutter/material.dart';

class WalletLedgerBranchWalletLedger extends StatefulWidget {
  const WalletLedgerBranchWalletLedger({super.key});

  @override
  State<WalletLedgerBranchWalletLedger> createState() =>
      _WalletLedgerBranchWalletLedgerState();
}

class _WalletLedgerBranchWalletLedgerState
    extends State<WalletLedgerBranchWalletLedger> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _WalletBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(5, 4, 5, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 15),
                  _buildBalanceCard(),
                  const SizedBox(height: 24),
                  _buildSummaryCards(),
                  const SizedBox(height: 19),
                  _buildLedgerEntry(
                    'B',
                    'BillDesk recharge',
                    '+ ₹20,000',
                    'CREDIT',
                    const Color(0xFF16A16D),
                    const Color(0xFFE1F3ED),
                  ),
                  const SizedBox(height: 10),
                  _buildLedgerEntry(
                    'B',
                    'Booking YYG-240918',
                    '− ₹1,850',
                    'DEBIT',
                    const Color(0xFFE23B43),
                    const Color(0xFFF8E4E6),
                  ),
                  const SizedBox(height: 10),
                  _buildLedgerEntry(
                    'C',
                    'COD settlement',
                    '+ ₹6,420',
                    'CREDIT',
                    const Color(0xFF16A16D),
                    const Color(0xFFE1F3ED),
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
          const Text(
            'Branch wallet and ledger',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          Container(
            width: 38,
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

  Widget _buildBalanceCard() {
    return Container(
      height: 96,
      padding: const EdgeInsets.fromLTRB(21, 20, 16, 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF263694), Color(0xFF4059D2)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x252339A1),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -38,
            right: -15,
            child: Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: Color(0x182F4CC4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available wallet balance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '₹84,260',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Positioned(
            left: -21,
            top: 0,
            bottom: 0,
            child: Container(
              width: 7,
              decoration: BoxDecoration(
                color: const Color(0xFFFFD000),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            '₹84,260',
            'Wallet',
            const Color(0xFF2939B4),
            const Color(0xFFE4E8FA),
          ),
        ),
        const SizedBox(width: 17),
        Expanded(
          child: _buildSummaryCard(
            '₹18,420',
            'Outstanding',
            const Color(0xFFED8612),
            const Color(0xFFFBEEDC),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
    String amount,
    String label,
    Color accent,
    Color iconBackground,
  ) {
    return Container(
      height: 84,
      padding: const EdgeInsets.fromLTRB(18, 14, 10, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBFF).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDCE3F0)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -18,
            top: -14,
            bottom: -10,
            child: Container(width: 5, color: accent),
          ),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              label,
              style: const TextStyle(color: Color(0xFF42557D), fontSize: 9),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: iconBackground,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: accent,
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

  Widget _buildLedgerEntry(
    String iconLabel,
    String title,
    String amount,
    String type,
    Color accent,
    Color iconBackground,
  ) {
    final isDebit = type == 'DEBIT';
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
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  amount,
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
              color: isDebit
                  ? const Color(0xFFF5E1E5)
                  : const Color(0xFFDDF0EB),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              type,
              style: TextStyle(
                color: isDebit
                    ? const Color(0xFFD73D48)
                    : const Color(0xFF168B68),
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

class _WalletBackground extends StatelessWidget {
  const _WalletBackground();

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
            top: 443,
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
