import 'package:flutter/material.dart';
import 'package:yogayogbranch/cancelcancelshipment/cancelcancelshipment.dart';
import 'package:yogayogbranch/claimsclaimshandling/claimsclaimshandling.dart';
import 'package:yogayogbranch/damagelostdamagedshipment/damagelostdamagedshipment.dart';
import 'package:yogayogbranch/branchprofile/branchprofile.dart';
import 'package:yogayogbranch/invoicesInvoicesdebitcreditnotes/invoicesInvoicesdebitcreditnotes.dart';
import 'package:yogayogbranch/paymentsapproval/paymentsapproval.dart';
import 'package:yogayogbranch/ratecalculator/ratecalculator.dart';
import 'package:yogayogbranch/refundsrefundmanagement/refundsrefundmanagement.dart';
import 'package:yogayogbranch/ridercommissionridercommission/ridercommissionridercommission.dart';
import 'package:yogayogbranch/reversereverseorderworkflow/reversereverseorderworkflow.dart';
import 'package:yogayogbranch/wrongaddresswrongaddressresolution/wrongaddresswrongaddressresolution.dart';
import 'package:yogayogbranch/weightmismatchweightmismatchcase/weightmismatchweightmismatchcase.dart';

class ExceptionHubDisputesExceptions extends StatefulWidget {
  const ExceptionHubDisputesExceptions({super.key});

  @override
  State<ExceptionHubDisputesExceptions> createState() =>
      _ExceptionHubDisputesExceptionsState();
}

class _ExceptionHubDisputesExceptionsState
    extends State<ExceptionHubDisputesExceptions> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _ExceptionBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(17, 9, 17, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 17),
                  const Text(
                    'Choose a workflow',
                    style: TextStyle(
                      color: Color(0xFF42557D),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 22),
                  _buildWorkflowGrid(),
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
      height: 59,
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
            'Disputes and exceptions',
            style: TextStyle(
              color: Colors.black,
              fontSize: 19,
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

  Widget _buildWorkflowGrid() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 19,
      crossAxisSpacing: 16,
      childAspectRatio: 1.08,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _WorkflowCard(
          accent: Color(0xFF2939B4),
          iconBackground: Color(0xFFE8EBFA),
          iconLabel: 'W',
          title: 'Weight mismatch',
          subtitle: '7 cases need review',
          onTap: _openWeightMismatch,
        ),
        _WorkflowCard(
          accent: Color(0xFF7350C9),
          iconBackground: Color(0xFFF0EAFB),
          iconLabel: 'C',
          title: 'Claims',
          subtitle: '3 open · 1 overdue',
          onTap: _openClaims,
        ),
        _WorkflowCard(
          accent: Color(0xFF139B68),
          iconBackground: Color(0xFFE4F4EF),
          iconLabel: 'D',
          title: 'Lost and damages',
          subtitle: '2 evidence requests',
          onTap: _openDamagedShipment,
        ),
        _WorkflowCard(
          accent: Color(0xFFED8612),
          iconBackground: Color(0xFFFBEEDC),
          iconLabel: '!',
          title: 'Hold / reverse / cancel',
          subtitle: '12 controlled actions',
          onTap: _openCancelShipment,
        ),
        _WorkflowCard(
          accent: Color(0xFFED8612),
          iconBackground: Color(0xFFFBEEDC),
          iconLabel: 'R',
          title: 'Reverse order workflow',
          subtitle: 'Create a reverse order',
          onTap: _openReverseOrder,
        ),
        _WorkflowCard(
          accent: Color(0xFF2939B4),
          iconBackground: Color(0xFFE8EBFA),
          iconLabel: 'A',
          title: 'Wrong-address resolution',
          subtitle: 'Validate and update address',
          onTap: _openWrongAddress,
        ),
        _WorkflowCard(
          accent: Color(0xFF139B68),
          iconBackground: Color(0xFFE4F4EF),
          iconLabel: 'I',
          title: 'Invoices, debit and credit notes',
          subtitle: 'Review billing documents',
          onTap: _openInvoices,
        ),
        _WorkflowCard(
          accent: Color(0xFF7350C9),
          iconBackground: Color(0xFFF0EAFB),
          iconLabel: 'R',
          title: 'Refund management',
          subtitle: 'Review and process refunds',
          onTap: _openRefunds,
        ),
        _WorkflowCard(
          accent: Color(0xFF2939B4),
          iconBackground: Color(0xFFE8EBFA),
          iconLabel: 'R',
          title: 'Rider commission',
          subtitle: 'Review rider payouts',
          onTap: _openRiderCommission,
        ),
        _WorkflowCard(
          accent: Color(0xFF2939B4),
          iconBackground: Color(0xFFE8EBFA),
          iconLabel: 'P',
          title: 'Payments and approval',
          subtitle: 'Review payment requests',
          onTap: _openPayments,
        ),
        _WorkflowCard(
          accent: Color(0xFF139B68),
          iconBackground: Color(0xFFE4F4EF),
          iconLabel: '₹',
          title: 'Rate calculator',
          subtitle: 'Calculate available shipping rates',
          onTap: _openRateCalculator,
        ),
        _WorkflowCard(
          accent: Color(0xFF2939B4),
          iconBackground: Color(0xFFE8EBFA),
          iconLabel: 'B',
          title: 'Branch profile',
          subtitle: 'View branch information',
          onTap: _openBranchProfile,
        ),
      ],
    );
  }

  void _openWeightMismatch() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const WeightMismatchWeightMismatchCase(),
      ),
    );
  }

  void _openClaims() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const ClaimsClaimsHandling()));
  }

  void _openDamagedShipment() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const DamageLostDamagedShipment()),
    );
  }

  void _openCancelShipment() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const CancelCancelShipment()));
  }

  void _openReverseOrder() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ReverseReverseOrderWorkflow()),
    );
  }

  void _openWrongAddress() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const WrongAddressWrongAddressResolution(),
      ),
    );
  }

  void _openInvoices() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const InvoicesInvoicesDebitCreditNotes(),
      ),
    );
  }

  void _openRefunds() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const RefundsRefundManagement()));
  }

  void _openRiderCommission() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const RiderCommissionRiderCommission()),
    );
  }

  void _openPayments() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const PaymentsApproval()));
  }

  void _openRateCalculator() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const RateCalculator()));
  }

  void _openBranchProfile() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const BranchProfile()));
  }
}

class _WorkflowCard extends StatelessWidget {
  const _WorkflowCard({
    required this.accent,
    required this.iconBackground,
    required this.iconLabel,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final Color accent;
  final Color iconBackground;
  final String iconLabel;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFF).withValues(alpha: 0.82),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFD9E1F1)),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -1,
                left: -1,
                right: -1,
                child: Container(
                  height: 7,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 15, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: iconBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          iconLabel,
                          style: TextStyle(
                            color: accent,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF52678F),
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 25,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF5CA),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          'Open ›',
                          style: TextStyle(
                            color: Color(0xFF17276D),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExceptionBackground extends StatelessWidget {
  const _ExceptionBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -55,
            right: -23,
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
            top: 400,
            left: -49,
            child: Container(
              width: 110,
              height: 97,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF1B5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 11,
            left: 27,
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
