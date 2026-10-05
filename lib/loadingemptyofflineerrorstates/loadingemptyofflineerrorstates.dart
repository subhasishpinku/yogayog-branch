import 'package:flutter/material.dart';

class LoadingEmptyOfflineErrorStates extends StatefulWidget {
  const LoadingEmptyOfflineErrorStates({super.key});

  @override
  State<LoadingEmptyOfflineErrorStates> createState() =>
      _LoadingEmptyOfflineErrorStatesState();
}

class _LoadingEmptyOfflineErrorStatesState
    extends State<LoadingEmptyOfflineErrorStates> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _StatesBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(9, 4, 9, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 28),
                  _buildStateCard(
                    'L',
                    'Loading',
                    'WAIT',
                    'Syncing live branch data...',
                    const Color(0xFFE4E8FA),
                    const Color(0xFF2939B4),
                  ),
                  const SizedBox(height: 20),
                  _buildStateCard(
                    'E',
                    'Empty',
                    'CLEAR',
                    'No records match this queue.',
                    const Color(0xFFE9EAEE),
                    const Color(0xFF596173),
                  ),
                  const SizedBox(height: 20),
                  _buildStateCard(
                    'O',
                    'Offline',
                    'RETRY',
                    'Read-only cache available. Transactions disabled.',
                    const Color(0xFFFBEEDC),
                    const Color(0xFFED8612),
                  ),
                  const SizedBox(height: 20),
                  _buildStateCard(
                    'E',
                    'Error',
                    'REPORT',
                    'Request failed. Retry uses the same idempotency key.',
                    const Color(0xFFF8E4E6),
                    const Color(0xFFE23B43),
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
              'Loading, empty, offline and error states',
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

  Widget _buildStateCard(
    String iconLabel,
    String title,
    String action,
    String description,
    Color iconBackground,
    Color accent,
  ) {
    return Container(
      height: 115,
      padding: const EdgeInsets.fromLTRB(14, 18, 17, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: const [
          BoxShadow(
            color: Color(0x190D1D68),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              iconLabel,
              style: TextStyle(
                color: accent,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF42557D),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 80,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                action,
                style: TextStyle(
                  color: accent,
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
}

class _StatesBackground extends StatelessWidget {
  const _StatesBackground();
  @override
  Widget build(BuildContext context) => IgnorePointer(
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
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
            ),
          ),
        ),
        Positioned(
          top: 390,
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
