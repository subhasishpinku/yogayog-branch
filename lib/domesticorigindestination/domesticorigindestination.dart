import 'package:flutter/material.dart';
import 'package:yogayogbranch/domesticparcelinformation/domesticparcelinformation.dart';

class DomesticOriginDestination extends StatefulWidget {
  const DomesticOriginDestination({super.key});

  @override
  State<DomesticOriginDestination> createState() =>
      _DomesticOriginDestinationState();
}

class _DomesticOriginDestinationState extends State<DomesticOriginDestination> {
  final _pickupController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _consigneeController = TextEditingController();
  final _mobileController = TextEditingController();

  @override
  void dispose() {
    _pickupController.dispose();
    _pincodeController.dispose();
    _consigneeController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFB),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
        child: _buildValidateButton(),
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              top: -48,
              right: -48,
              child: _circle(145, const Color(0xFFE8ECFF)),
            ),
            Positioned(
              top: 18,
              right: -17,
              child: _circle(91, const Color(0xFFDDE4FF)),
            ),
            Positioned(
              top: 345,
              left: -48,
              child: _circle(96, const Color(0xFFFFF3BE)),
            ),
            Positioned(
              bottom: 16,
              left: 20,
              child: _circle(37, const Color(0xFFE5F6F1)),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(15, 6, 15, 76),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 10),
                  _buildProgress(),
                  const SizedBox(height: 23),
                  _buildField(
                    'Pickup address / saved address',
                    'Enter pickup address',
                    _pickupController,
                  ),
                  _buildField(
                    'Destination pincode',
                    'Enter destination pincode',
                    _pincodeController,
                    keyboardType: TextInputType.number,
                  ),
                  _buildField(
                    'Consignee name',
                    'Enter consignee name',
                    _consigneeController,
                  ),
                  _buildField(
                    'Consignee mobile',
                    'Enter mobile number',
                    _mobileController,
                    keyboardType: TextInputType.phone,
                  ),
                ],
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
      padding: const EdgeInsets.symmetric(horizontal: 9),
      decoration: _cardDecoration(16),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 31,
              height: 31,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD43B),
                shape: BoxShape.circle,
              ),
              child: const Text(
                '‹',
                style: TextStyle(
                  color: Color(0xFF16358E),
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  height: 0.8,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Domestic: origin and destination',
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

  Widget _buildProgress() {
    const labels = ['Customer', 'Route', 'Parcel', 'Rate', 'Pay'];
    return SizedBox(
      height: 36,
      child: Row(
        children: List.generate(labels.length * 2 - 1, (index) {
          if (index.isOdd) {
            return Expanded(
              child: Container(height: 2, color: const Color(0xFFFFC800)),
            );
          }
          final step = index ~/ 2;
          final active = step <= 1;
          return SizedBox(
            width: 22,
            height: 36,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 21,
                    height: 21,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: active ? const Color(0xFF102681) : Colors.white,
                      shape: BoxShape.circle,
                      border: active
                          ? null
                          : Border.all(color: const Color(0xFFDDE3F0)),
                    ),
                    child: Text(
                      '${step + 1}',
                      style: TextStyle(
                        color: active ? Colors.white : const Color(0xFF4B5A7B),
                        fontSize: 8,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 24,
                  left: -6,
                  right: -6,
                  child: Text(
                    labels[step],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: active
                          ? const Color(0xFF102681)
                          : const Color(0xFF4B5A7B),
                      fontSize: 7,
                      fontWeight: active ? FontWeight.w800 : FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildField(
    String label,
    String hint,
    TextEditingController controller, {
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1, bottom: 5),
            child: Text(
              label,
              style: const TextStyle(color: Color(0xFF33456D), fontSize: 9),
            ),
          ),
          Container(
            height: 45,
            decoration: _cardDecoration(13),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              style: const TextStyle(color: Color(0xFF0B0D13), fontSize: 11),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color(0xFFB2BCD0),
                  fontSize: 10,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValidateButton() {
    return SizedBox(
      height: 47,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF26369E), Color(0xFF4058DA)],
          ),
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF26369E).withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const DomesticParcelInformation(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 25,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD000),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const Expanded(
                child: Text(
                  'Validate route',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Text(
                '›',
                style: TextStyle(
                  color: Color(0xFFFFD000),
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  height: 0.7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration(double radius) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFB9C3DF).withValues(alpha: 0.35),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
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
