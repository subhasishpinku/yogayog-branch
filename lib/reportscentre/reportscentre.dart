import 'package:flutter/material.dart';
import 'package:yogayogbranch/cashbookingcodreport/cashbookingcodreport.dart';
import 'package:yogayogbranch/coloaderreport/coloaderreport.dart';
import 'package:yogayogbranch/deliveryrunsheet/deliveryrunsheet.dart';
import 'package:yogayogbranch/pickuprunsheet/pickuprunsheet.dart';

class ReportsCentre extends StatefulWidget {
  const ReportsCentre({super.key});

  @override
  State<ReportsCentre> createState() => _ReportsCentreState();
}

class _ReportsCentreState extends State<ReportsCentre> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _ReportsBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(15, 9, 15, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 17),
                  const Text(
                    'Choose a workflow',
                    style: TextStyle(color: Color(0xFF42557D), fontSize: 12),
                  ),
                  const SizedBox(height: 22),
                  _buildReportGrid(),
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
            'Reports centre',
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

  Widget _buildReportGrid() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 19,
      crossAxisSpacing: 16,
      childAspectRatio: 1.08,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _ReportCard(
          accent: Color(0xFF2939B4),
          iconBackground: Color(0xFFE8EBFA),
          iconLabel: 'C',
          title: 'Co-loader reports',
          subtitle: 'Manifests and reconciliation',
          onTap: _openCoLoaderReport,
        ),
        _ReportCard(
          accent: Color(0xFF7350C9),
          iconBackground: Color(0xFFF0EAFB),
          iconLabel: '₹',
          title: 'Cash booking report',
          subtitle: 'COD and payment views',
          onTap: _openCashBookingReport,
        ),
        _ReportCard(
          accent: Color(0xFF139B68),
          iconBackground: Color(0xFFE4F4EF),
          iconLabel: 'D',
          title: 'Delivery run sheet',
          subtitle: 'Stops, POD and NDR',
          onTap: _openDeliveryRunSheet,
        ),
        _ReportCard(
          accent: Color(0xFFED8612),
          iconBackground: Color(0xFFFBEEDC),
          iconLabel: 'P',
          title: 'Pickup run sheet',
          subtitle: 'Assigned and completed pickups',
          onTap: _openPickupRunSheet,
        ),
      ],
    );
  }

  void _openCoLoaderReport() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const CoLoaderReport()));
  }

  void _openCashBookingReport() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const CashBookingCODReport()));
  }

  void _openDeliveryRunSheet() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const DeliveryRunSheet()));
  }

  void _openPickupRunSheet() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const PickupRunSheet()));
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard({
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
                      alignment: Alignment.center,
                      child: Text(
                        iconLabel,
                        style: TextStyle(
                          color: accent,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
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

class _ReportsBackground extends StatelessWidget {
  const _ReportsBackground();

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
            top: 398,
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
            left: 25,
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
