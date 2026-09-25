import 'package:flutter/material.dart';
import 'package:yogayogbranch/domesticcustomerservice/domesticcustomerservice.dart';
import 'package:yogayogbranch/internationalexportbooking/internationalexportbooking.dart';
import 'package:yogayogbranch/internationalimportbooking/internationalimportbooking.dart';

class BranchAssistedBookingHub extends StatefulWidget {
  const BranchAssistedBookingHub({super.key});

  @override
  State<BranchAssistedBookingHub> createState() =>
      _BranchAssistedBookingHubState();
}

class _BranchAssistedBookingHubState extends State<BranchAssistedBookingHub> {
  final List<_BookingWorkflow> _workflows = const [
    _BookingWorkflow(
      title: 'Domestic booking',
      description: 'Local, national, bike or truck',
      icon: 'D',
      accent: Color(0xFF2639A8),
    ),
    _BookingWorkflow(
      title: 'International export',
      description: 'Documents and customs flow',
      icon: 'E',
      accent: Color(0xFF7654D9),
    ),
    _BookingWorkflow(
      title: 'International import',
      description: 'Import origin and landed charges',
      icon: 'I',
      accent: Color(0xFF20A26B),
    ),
    _BookingWorkflow(
      title: 'Resume draft',
      description: '2 incomplete bookings',
      icon: 'R',
      accent: Color(0xFFF28A17),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFB),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
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
                  bottom: 12,
                  left: 15,
                  child: _circle(37, const Color(0xFFE5F6F1)),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(6, 6, 6, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 15),
                      const Text(
                        'Choose a workflow',
                        style: TextStyle(
                          color: Color(0xFF33456D),
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 18),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _workflows.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 13,
                              mainAxisSpacing: 18,
                              childAspectRatio: 0.98,
                            ),
                        itemBuilder: (context, index) =>
                            _buildWorkflowCard(_workflows[index]),
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
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.of(context).pop(),
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
          const Expanded(
            child: Text(
              'Branch-assisted booking hub',
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

  Widget _buildWorkflowCard(_BookingWorkflow workflow) {
    return GestureDetector(
      onTap: () {
        if (workflow.title == 'Domestic booking') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const DomesticCustomerService()),
          );
          return;
        }

        if (workflow.title == 'International export') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const InternationalExportBooking(),
            ),
          );
          return;
        }

        if (workflow.title == 'International import') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const InternationalImportBooking(),
            ),
          );
          return;
        }

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${workflow.title} selected')));
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFF),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFDDE3F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: workflow.accent,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
              child: Container(
                width: 31,
                height: 31,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: workflow.accent.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  workflow.icon,
                  style: TextStyle(
                    color: workflow.accent,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 7, 6, 0),
              child: Text(
                workflow.title,
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
              padding: const EdgeInsets.fromLTRB(16, 5, 5, 0),
              child: Text(
                workflow.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Color(0xFF4B5A7B), fontSize: 8),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 9),
              child: Container(
                width: 58,
                height: 22,
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

class _BookingWorkflow {
  const _BookingWorkflow({
    required this.title,
    required this.description,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String description;
  final String icon;
  final Color accent;
}
