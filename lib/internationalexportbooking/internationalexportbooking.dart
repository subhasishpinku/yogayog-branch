import 'package:flutter/material.dart';

class InternationalExportBooking extends StatefulWidget {
  const InternationalExportBooking({super.key});

  @override
  State<InternationalExportBooking> createState() =>
      _InternationalExportBookingState();
}

class _InternationalExportBookingState
    extends State<InternationalExportBooking> {
  final _formKey = GlobalKey<FormState>();
  final _customerController = TextEditingController();
  final _destinationController = TextEditingController();
  final _consigneeController = TextEditingController();
  final _commodityController = TextEditingController();
  final _valueController = TextEditingController();

  @override
  void dispose() {
    _customerController.dispose();
    _destinationController.dispose();
    _consigneeController.dispose();
    _commodityController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FF),
      body: SafeArea(
        child: Stack(
          children: [
            const _BackgroundDecoration(),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 4, 10, 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 13),
                    _buildField('Customer and GST', _customerController),
                    _buildField('Destination country', _destinationController),
                    _buildField('Consignee and contact', _consigneeController),
                    _buildField('Commodity / HS code', _commodityController),
                    _buildField(
                      'Weight, value and currency',
                      _valueController,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 17),
                    _buildContinueButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1CB9C3DF),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Material(
            color: const Color(0xFFFFD43B),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => Navigator.maybePop(context),
              child: const SizedBox(
                width: 31,
                height: 31,
                child: Icon(
                  Icons.chevron_left,
                  color: Color(0xFF16358E),
                  size: 21,
                ),
              ),
            ),
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Text(
              'International export booking',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF0B0D13),
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            width: 34,
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

  Widget _buildField(
    String label,
    TextEditingController controller, {
    TextInputAction textInputAction = TextInputAction.next,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 5),
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF263F74),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x160B1B58),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: TextFormField(
              controller: controller,
              textInputAction: textInputAction,
              style: const TextStyle(
                color: Color(0xFF13245D),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      height: 47,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF06155C), Color(0xFF334BC8)],
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3D14247E),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Customs documents step selected')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Row(
            children: [
              Container(width: 3, height: 24, color: const Color(0xFFFFCC00)),
              const Expanded(
                child: Text(
                  'Continue to customs documents',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFFFFCC00),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -64,
            right: -32,
            child: Container(
              width: 145,
              height: 145,
              decoration: const BoxDecoration(
                color: Color(0xFFE8ECFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 350,
            left: -38,
            child: Container(
              width: 82,
              height: 82,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF3BE),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -18,
            left: 22,
            child: Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: Color(0xFFE5F6F1),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
