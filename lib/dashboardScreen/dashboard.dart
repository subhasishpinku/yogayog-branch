import 'package:flutter/material.dart';
import 'package:yogayogbranch/Branchcommanddashboard/branchcommanddashboard.dart';
import 'package:yogayogbranch/bookScreen/customer_type.dart';
import 'package:yogayogbranch/customerdirectory/customerdirectory.dart';
import 'package:yogayogbranch/dashboardScreen/widgets/CustomDrawer.dart';
import 'package:yogayogbranch/dashboardScreen/widgets/duildMyNavBar.dart';
import 'package:yogayogbranch/more/more_screen.dart';
import 'package:yogayogbranch/sessiondeviceverification/sessiondeviceverification.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Dashboard> {
  final String title = "HAYAT";
  int pageIndex = 0;
  final List<Widget> pages = [
    const BranchCommandDashboard(),
    const CustomerDirectory(),
    const SessionDeviceVerification(),
    const SessionDeviceVerification(),
    const MoreScreen(),
  ];

  void _onPageSelected(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFB),
      body: pages[pageIndex],
      bottomNavigationBar: BuildMyNavBar(
        pageIndex: pageIndex,
        onPageSelected: _onPageSelected,
      ),
      // drawer: const CustomDrawer(),
    );
  }
}
