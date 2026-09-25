import 'package:flutter/material.dart';
import '../Individualcustomerregistration/Individual_customer_registration.dart';
import '../businesscustomerregistration/businesscustomerregistration.dart';
import '../provisioncustomercredentials/provisioncustomercredentials.dart';

class CustomerType extends StatefulWidget {
  const CustomerType({super.key});

  @override
  State<CustomerType> createState() => _CustomerTypeState();
}

class _CustomerTypeState extends State<CustomerType> {
  int? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFB),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            return Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F8FF),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(22),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFFB9C3DF,
                          ).withValues(alpha: 0.32),
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
                          top: height * 0.47,
                          left: -45,
                          child: _circle(100, const Color(0xFFFFF3BE)),
                        ),
                        SingleChildScrollView(
                          padding: const EdgeInsets.only(bottom: 90),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _buildHeader(width),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(16, 16, 16, 18),
                                child: Text(
                                  'Choose a workflow',
                                  style: TextStyle(
                                    color: Color(0xFF33456D),
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: _customerCard(
                                            index: 0,
                                            accent: const Color(0xFF2639A8),
                                            icon: 'I',
                                            title: 'Individual customer',
                                            description:
                                                'Personal bookings and saved addresses',
                                          ),
                                        ),
                                        const SizedBox(width: 13),
                                        Expanded(
                                          child: _customerCard(
                                            index: 1,
                                            accent: const Color(0xFF7654D9),
                                            icon: 'B',
                                            title: 'Business customer',
                                            description:
                                                'GST, departments and credit terms',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    _customerCard(
                                      index: 2,
                                      accent: const Color(0xFF20A26B),
                                      icon: '✓',
                                      title: 'Provision customer credentials',
                                      description:
                                          'Send secure login instructions to customer',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: _buildContinueButton(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(double width) {
    return Container(
      height: 52,
      margin: EdgeInsets.fromLTRB(width * 0.035, 6, width * 0.035, 0),
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
          const SizedBox(width: 11),
          const Text(
            'Select customer type',
            style: TextStyle(
              color: Color(0xFF0B0D13),
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
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

  Widget _customerCard({
    required int index,
    required Color accent,
    required String icon,
    required String title,
    required String description,
  }) {
    final selected = _selectedType == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedType = index),
      child: Container(
        height: 114,
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFF),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: selected ? accent : const Color(0xFFDDE3F0),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 8, 0),
              child: Container(
                width: 31,
                height: 31,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  icon,
                  style: TextStyle(
                    color: accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 4, 0),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF0B0D13),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 4, 0),
              child: Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Color(0xFF4B5A7B), fontSize: 8),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 58,
                height: 22,
                margin: EdgeInsets.zero,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF5CF),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Text(
                  'Open ›',
                  style: TextStyle(
                    color: Color(0xFF102681),
                    fontSize: 9,
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

  Widget _buildContinueButton() {
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
          onPressed: _selectedType == null ? null : _openSelectedRegistration,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
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
                  'Continue',
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

  void _openSelectedRegistration() {
    final Widget page = switch (_selectedType) {
      0 => const IndividualCustomerRegistration(),
      1 => const BusinessCustomerRegistration(),
      2 => const ProvisionCustomerCredentials(),
      _ => const CustomerType(),
    };

    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }
}
