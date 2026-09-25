import 'package:flutter/material.dart';
import 'package:yogayogbranch/domesticratecarrierselection/domesticratecarrierselection.dart';

class DomesticParcelInformation extends StatefulWidget {
  const DomesticParcelInformation({super.key});

  @override
  State<DomesticParcelInformation> createState() =>
      _DomesticParcelInformationState();
}

class _DomesticParcelInformationState extends State<DomesticParcelInformation> {
  final _piecesController = TextEditingController();
  final _packageController = TextEditingController();
  final _weightController = TextEditingController();
  final _dimensionsController = TextEditingController();

  @override
  void dispose() {
    _piecesController.dispose();
    _packageController.dispose();
    _weightController.dispose();
    _dimensionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFB),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: _buildCalculateButton(),
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
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(13, 6, 13, 76),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 10),
                  _buildProgress(),
                  const SizedBox(height: 23),
                  _buildField(
                    'Number of pieces',
                    'Enter number of pieces',
                    _piecesController,
                    keyboardType: TextInputType.number,
                  ),
                  _buildField(
                    'Package type',
                    'Select package type',
                    _packageController,
                    readOnly: true,
                    onTap: _showPackageTypes,
                  ),
                  _buildField(
                    'Actual weight',
                    'Enter actual weight',
                    _weightController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  _buildField(
                    'Dimensions / volumetric weight',
                    'Enter dimensions or volumetric weight',
                    _dimensionsController,
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
              'Domestic: parcel information',
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
          if (index.isOdd)
            return Expanded(
              child: Container(height: 2, color: const Color(0xFFFFC800)),
            );
          final step = index ~/ 2;
          final active = step <= 2;
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
    bool readOnly = false,
    VoidCallback? onTap,
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
              readOnly: readOnly,
              onTap: onTap,
              style: const TextStyle(color: Color(0xFF0B0D13), fontSize: 11),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color(0xFFB2BCD0),
                  fontSize: 10,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                border: InputBorder.none,
                suffixIcon: readOnly
                    ? const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF4B5A7B),
                        size: 20,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculateButton() {
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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Chargeable weight calculated')),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DomeStiCrateCarrierSelection(),
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
                  'Calculate chargeable weight',
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

  void _showPackageTypes() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFFF9FAFF),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (context) {
        const types = ['Document', 'Parcel', 'Fragile parcel'];
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select package type',
                  style: TextStyle(
                    color: Color(0xFF0B0D13),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                ...types.map(
                  (type) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      type,
                      style: const TextStyle(
                        color: Color(0xFF33456D),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Color(0xFF26369E),
                    ),
                    onTap: () {
                      setState(() => _packageController.text = type);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _cardDecoration(double radius) => BoxDecoration(
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

  Widget _circle(double size, Color color) => IgnorePointer(
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ),
  );
}
