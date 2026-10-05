import 'package:flutter/material.dart';

class CancelCancelShipment extends StatefulWidget {
  const CancelCancelShipment({super.key});

  @override
  State<CancelCancelShipment> createState() => _CancelCancelShipmentState();
}

class _CancelCancelShipmentState extends State<CancelCancelShipment> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _CancelBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(7, 1, 7, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 39),
                  _buildWarningIcon(),
                  const SizedBox(height: 19),
                  const Text(
                    'Cancel YYG-240918?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 29),
                  _buildMessageCard(),
                  const SizedBox(height: 69),
                  _buildConfirmButton(),
                  const SizedBox(height: 10),
                  _buildKeepActiveButton(),
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
            'Cancel shipment',
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

  Widget _buildWarningIcon() {
    return Container(
      width: 111,
      height: 111,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0xFFFFF6D2),
        shape: BoxShape.circle,
      ),
      child: const Text(
        '!',
        style: TextStyle(
          color: Color(0xFFE87B0C),
          fontSize: 39,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildMessageCard() {
    return Container(
      height: 117,
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x190D1D68),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cancellation may reverse payment, release the rider and notify the customer.',
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: Color(0xFF42557D),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Text(
            'Reason and operator identity are stored in audit history.',
            style: TextStyle(
              color: Color(0xFFE3262F),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 3),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return SizedBox(
      height: 53,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE33D43),
          foregroundColor: Colors.white,
          elevation: 7,
          shadowColor: const Color(0x35C92A31),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Confirm cancellation',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _buildKeepActiveButton() {
    return SizedBox(
      height: 54,
      child: OutlinedButton(
        onPressed: () => Navigator.of(context).pop(),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF12259A),
          side: const BorderSide(color: Color(0xFF12259A), width: 1.5),
          elevation: 4,
          shadowColor: const Color(0x250D1D68),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Keep shipment active',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

class _CancelBackground extends StatelessWidget {
  const _CancelBackground();

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
            top: 399,
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
