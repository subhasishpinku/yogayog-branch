import 'package:flutter/material.dart';

class BusinessCustomerRegistration extends StatefulWidget {
  const BusinessCustomerRegistration({super.key});

  @override
  State<BusinessCustomerRegistration> createState() =>
      _BusinessCustomerRegistrationState();
}

class _BusinessCustomerRegistrationState
    extends State<BusinessCustomerRegistration> {
  final _businessNameController = TextEditingController();
  final _gstController = TextEditingController();
  final _contactController = TextEditingController();
  final _phoneEmailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _businessNameController.dispose();
    _gstController.dispose();
    _contactController.dispose();
    _phoneEmailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFB),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            return Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 12, 8),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xFFF6F8FF),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(22),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFB9C3DF).withValues(alpha: 0.32),
                    blurRadius: 18,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -55,
                    right: -45,
                    child: _circle(145, const Color(0xFFE8ECFF)),
                  ),
                  Positioned(
                    top: 22,
                    right: -14,
                    child: _circle(90, const Color(0xFFDDE4FF)),
                  ),
                  Positioned(
                    top: height * 0.48,
                    left: -45,
                    child: _circle(100, const Color(0xFFFFF3BE)),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(14, 6, 14, 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(width),
                        const SizedBox(height: 13),
                        _fieldLabel('Legal business name'),
                        const SizedBox(height: 6),
                        _inputField(_businessNameController),
                        const SizedBox(height: 10),
                        _fieldLabel('GST number'),
                        const SizedBox(height: 6),
                        _inputField(_gstController),
                        const SizedBox(height: 10),
                        _fieldLabel('Contact person'),
                        const SizedBox(height: 6),
                        _inputField(_contactController),
                        const SizedBox(height: 10),
                        _fieldLabel('Phone and email'),
                        const SizedBox(height: 6),
                        _inputField(_phoneEmailController),
                        const SizedBox(height: 10),
                        _fieldLabel('Registered address'),
                        const SizedBox(height: 6),
                        _inputField(_addressController, maxLines: 1),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 14,
                    right: 14,
                    bottom: 18,
                    child: _buildActionButton(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(double width) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB9C3DF).withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 31,
            height: 31,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD43B),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              '‹',
              style: TextStyle(
                color: Color(0xFF16358E),
                fontSize: 21,
                height: 0.8,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Business customer registration',
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

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF33456D),
        fontSize: 10,
      ),
    );
  }

  Widget _inputField(
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB9C3DF).withValues(alpha: 0.3),
            blurRadius: 11,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildActionButton() {
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
          onPressed: () {},
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
                  'Verify and create business',
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
