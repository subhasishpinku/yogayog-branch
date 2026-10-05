import 'package:flutter/material.dart';

class InvoicesInvoicesDebitCreditNotes extends StatefulWidget {
  const InvoicesInvoicesDebitCreditNotes({super.key});

  @override
  State<InvoicesInvoicesDebitCreditNotes> createState() =>
      _InvoicesInvoicesDebitCreditNotesState();
}

class _InvoicesInvoicesDebitCreditNotesState
    extends State<InvoicesInvoicesDebitCreditNotes> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _InvoicesBackground(),
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
                  _buildInvoiceRow(
                    'I',
                    'INV-2609-188',
                    'Saha Traders · ₹12,840',
                    'UNPAID',
                    const Color(0xFF16A16D),
                    const Color(0xFFE1F3ED),
                  ),
                  const SizedBox(height: 10),
                  _buildInvoiceRow(
                    'D',
                    'DN-2609-019',
                    'Weight adjustment · ₹185',
                    'DEBIT',
                    const Color(0xFFE23B43),
                    const Color(0xFFF8E4E6),
                  ),
                  const SizedBox(height: 10),
                  _buildInvoiceRow(
                    'C',
                    'CN-2609-012',
                    'Cancelled service · ₹850',
                    'CREDIT',
                    const Color(0xFF16A16D),
                    const Color(0xFFE1F3ED),
                  ),
                  const SizedBox(height: 267),
                  _buildActionButton(),
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
              'Invoices, debit and credit notes',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
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

  Widget _buildInvoiceRow(
    String iconLabel,
    String invoice,
    String details,
    String status,
    Color accent,
    Color iconBackground,
  ) {
    final isDebit = status == 'DEBIT';
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
                  invoice,
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
              color: isDebit
                  ? const Color(0xFFF5E1E5)
                  : const Color(0xFFDDF0EB),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              status,
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

  Widget _buildActionButton() {
    return Container(
      height: 53,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF263694), Color(0xFF4059D2)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(17),
        boxShadow: const [
          BoxShadow(
            color: Color(0x302339A1),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 28,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD000),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Generate postpaid invoice',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18),
            child: Text(
              '›',
              style: TextStyle(
                color: Color(0xFFFFD000),
                fontSize: 27,
                fontWeight: FontWeight.w800,
                height: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InvoicesBackground extends StatelessWidget {
  const _InvoicesBackground();

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
