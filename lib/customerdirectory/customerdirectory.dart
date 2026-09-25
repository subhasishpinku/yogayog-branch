import 'package:flutter/material.dart';
import 'package:yogayogbranch/bookScreen/customer_type.dart';

class CustomerDirectory extends StatefulWidget {
  const CustomerDirectory({super.key});

  @override
  State<CustomerDirectory> createState() => _CustomerDirectoryState();
}

class _CustomerDirectoryState extends State<CustomerDirectory> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';

  final List<_Customer> _customers = const [
    _Customer(
      name: 'Riya Sen',
      type: 'Individual',
      detail: '12 bookings',
      status: 'ACTIVE',
      initials: 'R',
      accent: Color(0xFF16A16D),
    ),
    _Customer(
      name: 'Saha Traders',
      type: 'Business',
      detail: '₹18,420 due',
      status: 'DUE',
      initials: 'S',
      accent: Color(0xFFE83D49),
    ),
    _Customer(
      name: 'Amit Das',
      type: 'Individual',
      detail: 'KYC pending',
      status: 'KYC',
      initials: 'A',
      accent: Color(0xFFF28A17),
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final visibleCustomers = _customers.where((customer) {
      final matchesSearch = query.isEmpty ||
          customer.name.toLowerCase().contains(query) ||
          customer.type.toLowerCase().contains(query);
      final matchesFilter = _selectedFilter == 'All' ||
          customer.status == _selectedFilter.toUpperCase();
      return matchesSearch && matchesFilter;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFB),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  top: -42,
                  right: -44,
                  child: _circle(138, const Color(0xFFE0E6FF)),
                ),
                Positioned(
                  top: 346,
                  left: -47,
                  child: _circle(96, const Color(0xFFFFF2B7)),
                ),
                Positioned.fill(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(8, 6, 8, 14),
                          child: Column(
                            children: [
                              _buildHeader(),
                              const SizedBox(height: 14),
                              _buildSearchBar(visibleCustomers.length),
                              const SizedBox(height: 20),
                              if (visibleCustomers.isEmpty)
                                const Padding(
                                  padding: EdgeInsets.only(top: 24),
                                  child: Text(
                                    'No customers found',
                                    style: TextStyle(
                                      color: Color(0xFF4B5A7B),
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              else
                                ...visibleCustomers.map(_buildCustomerCard),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 4, 10),
                        child: _buildRegisterButton(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 43,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: _cardDecoration(16),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (Navigator.of(context).canPop()) Navigator.of(context).pop();
            },
            child: Container(
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
                  fontWeight: FontWeight.w800,
                  height: 0.8,
                ),
              ),
            ),
          ),
          const SizedBox(width: 11),
          const Text(
            'Customer directory',
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
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _showFilterSheet,
            child: Container(
              width: 51,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5CF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                'Filter',
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
    );
  }

  Widget _buildSearchBar(int resultCount) {
    return Container(
      height: 41,
      padding: const EdgeInsets.only(left: 16, right: 8),
      decoration: _cardDecoration(13),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              textInputAction: TextInputAction.search,
              style: const TextStyle(
                color: Color(0xFF0B0D13),
                fontSize: 11,
              ),
              decoration: const InputDecoration(
                hintText: 'Search and filter records',
                hintStyle: TextStyle(color: Color(0xFF7180A1), fontSize: 10),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          Container(
            height: 25,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF5CF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              '$resultCount shown',
              style: const TextStyle(
                color: Color(0xFF102681),
                fontSize: 9,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerCard(_Customer customer) {
    final statusColor = switch (customer.status) {
      'ACTIVE' => const Color(0xFF16A16D),
      'DUE' => const Color(0xFFE83D49),
      _ => const Color(0xFFF28A17),
    };

    return Container(
      height: 67,
      margin: const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFF),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFDDE3F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 67,
            decoration: BoxDecoration(
              color: customer.accent,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(15),
              ),
            ),
          ),
          const SizedBox(width: 9),
          Container(
            width: 27,
            height: 27,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: customer.accent.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Text(
              customer.initials,
              style: TextStyle(
                color: customer.accent,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer.name,
                  style: const TextStyle(
                    color: Color(0xFF0B0D13),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${customer.type} · ${customer.detail}',
                  style: const TextStyle(
                    color: Color(0xFF4B5A7B),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 68,
            height: 24,
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.13),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              customer.status,
              style: TextStyle(
                color: statusColor,
                fontSize: 9,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
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
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const CustomerType()),
          ),
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
                  'Register customer',
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

  void _showFilterSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFFF9FAFF),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (context) {
        const filters = ['All', 'Active', 'Due', 'Kyc'];
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Filter customers',
                  style: TextStyle(
                    color: Color(0xFF0B0D13),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  children: filters.map((filter) {
                    final selected = _selectedFilter == filter;
                    return ChoiceChip(
                      label: Text(filter),
                      selected: selected,
                      onSelected: (_) {
                        setState(() => _selectedFilter = filter);
                        Navigator.pop(context);
                      },
                      selectedColor: const Color(0xFFFFD43B),
                      labelStyle: TextStyle(
                        color: selected
                            ? const Color(0xFF102681)
                            : const Color(0xFF4B5A7B),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Customer {
  const _Customer({
    required this.name,
    required this.type,
    required this.detail,
    required this.status,
    required this.initials,
    required this.accent,
  });

  final String name;
  final String type;
  final String detail;
  final String status;
  final String initials;
  final Color accent;
}
