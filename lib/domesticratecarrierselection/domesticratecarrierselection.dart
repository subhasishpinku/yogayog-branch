import 'package:flutter/material.dart';

class DomeStiCrateCarrierSelection extends StatefulWidget {
  const DomeStiCrateCarrierSelection({super.key});

  @override
  State<DomeStiCrateCarrierSelection> createState() =>
      _DomeStiCrateCarrierSelectionState();
}

class _DomeStiCrateCarrierSelectionState
    extends State<DomeStiCrateCarrierSelection> {
  int _selectedCarrier = 0;

  static const _navy = Color(0xFF06155C);
  static const _blue = Color(0xFF334BC8);
  static const _yellow = Color(0xFFFFCC00);
  static const _pageBackground = Color(0xFFF7F9FF);

  final _carriers = const [
    _Carrier(
      name: 'Yogayog Express',
      deliveryTime: '1-2 days',
      price: '₹1,850',
      badge: 'RECOMMENDED',
    ),
    _Carrier(
      name: 'Delhivery Surface',
      deliveryTime: '3-4 days',
      price: '₹1,620',
      badge: 'VALUE',
    ),
    _Carrier(
      name: 'Blue Dart Air',
      deliveryTime: 'Next day',
      price: '₹2,480',
      badge: 'FAST',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: SafeArea(
        child: Stack(
          children: [
            const _BackgroundDecoration(),
            LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 20),
                      const Text(
                        '3 services available',
                        style: TextStyle(
                          color: Color(0xFF47526E),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 18),
                      ...List.generate(
                        _carriers.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: _buildCarrierCard(index),
                        ),
                      ),
                      const SizedBox(height: 44),
                      _buildContinueButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          children: [
            Material(
              color: _yellow,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => Navigator.maybePop(context),
                child: const SizedBox(
                  width: 38,
                  height: 38,
                  child: Icon(Icons.chevron_left, color: _navy, size: 22),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Domestic: rate and carrier selection',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 13),
        const _ProgressSteps(),
      ],
    );
  }

  Widget _buildCarrierCard(int index) {
    final carrier = _carriers[index];
    final selected = index == _selectedCarrier;
    return Semantics(
      button: true,
      selected: selected,
      label: '${carrier.name}, ${carrier.price}',
      child: GestureDetector(
        onTap: () => setState(() => _selectedCarrier = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.fromLTRB(17, 13, 17, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? _yellow : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x160B1B58),
                blurRadius: 12,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carrier.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      carrier.deliveryTime,
                      style: const TextStyle(
                        color: Color(0xFF526080),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 9),
                    _Badge(label: carrier.badge, emphasized: selected),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                carrier.price,
                style: const TextStyle(
                  color: _navy,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      height: 47,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [_navy, _blue]),
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
          onPressed: () =>
              Navigator.maybePop(context, _carriers[_selectedCarrier]),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Row(
            children: [
              Container(width: 3, height: 24, color: _yellow),
              const Expanded(
                child: Text(
                  'Select service and continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: _yellow, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressSteps extends StatelessWidget {
  const _ProgressSteps();

  static const _navy = Color(0xFF06155C);
  static const _yellow = Color(0xFFFFCC00);

  @override
  Widget build(BuildContext context) {
    const labels = ['Customer', 'Route', 'Parcel', 'Rate', 'Pay'];
    return Column(
      children: [
        Row(
          children: List.generate(labels.length * 2 - 1, (index) {
            if (index.isOdd)
              return const Expanded(
                child: Divider(color: _yellow, thickness: 2, height: 2),
              );
            final step = index ~/ 2;
            return Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: step == labels.length - 1 ? Colors.white : _navy,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${step + 1}',
                  style: TextStyle(
                    color: step == labels.length - 1
                        ? const Color(0xFFB5B9C5)
                        : Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: labels
              .map(
                (label) => Text(
                  label,
                  style: const TextStyle(
                    color: _navy,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.emphasized});
  final String label;
  final bool emphasized;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
    decoration: BoxDecoration(
      color: emphasized ? const Color(0xFFFFF8D5) : const Color(0xFFF1F4F9),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: Color(0xFF24336A),
        fontSize: 9,
        fontWeight: FontWeight.w700,
        letterSpacing: .1,
      ),
    ),
  );
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration();

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: Stack(
      children: [
        Positioned(
          top: -78,
          right: -42,
          child: Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              color: Color(0xFFE8ECFF),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          left: -20,
          child: Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF4B9),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 3,
          left: 21,
          child: Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFFE7F8F1),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ),
  );
}

class _Carrier {
  const _Carrier({
    required this.name,
    required this.deliveryTime,
    required this.price,
    required this.badge,
  });
  final String name;
  final String deliveryTime;
  final String price;
  final String badge;
}
