import 'package:flutter/material.dart';
import '../shipmentdetailcompleteshipmentdetail/shipmentdetailcompleteshipmentdetail.dart';

class SearchResultsAWBSearchResults extends StatefulWidget {
  const SearchResultsAWBSearchResults({super.key});

  @override
  State<SearchResultsAWBSearchResults> createState() =>
      _SearchResultsAWBSearchResultsState();
}

class _SearchResultsAWBSearchResultsState
    extends State<SearchResultsAWBSearchResults> {
  static const _navy = Color(0xFF12259A);
  static const _yellow = Color(0xFFFFD632);
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _SearchBackground(),
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
                  _buildResultCard(
                    awb: 'YYG-240918',
                    details: 'Riya Sen · In Transit',
                    status: 'LIVE',
                    accent: _navy,
                    iconBackground: const Color(0xFFE1E6F8),
                    statusBackground: const Color(0xFFDCE2F5),
                  ),
                  _buildResultCard(
                    awb: 'YYG-240871',
                    details: 'Amit Das · Ready to ship',
                    status: 'READY',
                    accent: const Color(0xFF16A16D),
                    iconBackground: const Color(0xFFE0F3ED),
                    statusBackground: const Color(0xFFDCEFEA),
                  ),
                  _buildResultCard(
                    awb: 'YYG-240802',
                    details: 'S. Traders · Delivered',
                    status: 'DONE',
                    accent: const Color(0xFF16A16D),
                    iconBackground: const Color(0xFFE3F4EF),
                    statusBackground: const Color(0xFFDCEFEA),
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
          const Text(
            'AWB search results',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Container(
            height: 27,
            padding: const EdgeInsets.symmetric(horizontal: 17),
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
              style: TextStyle(
                color: Color(0xFF71809E),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
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

  Widget _buildResultCard({
    required String awb,
    required String details,
    required String status,
    required Color accent,
    required Color iconBackground,
    required Color statusBackground,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ShipmentDetailCompleteShipmentDetail(),
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
                  'Y',
                  style: TextStyle(
                    color: accent,
                    fontSize: 14,
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
                    awb,
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

class _SearchBackground extends StatelessWidget {
  const _SearchBackground();

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
