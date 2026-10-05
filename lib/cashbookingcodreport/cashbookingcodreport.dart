import 'package:flutter/material.dart';
import 'package:yogayogbranch/coloaderreport/coloaderreport.dart';

class CashBookingCODReport extends StatefulWidget {
  const CashBookingCODReport({super.key});

  @override
  State<CashBookingCODReport> createState() => _CashBookingCODReportState();
}

class _CashBookingCODReportState extends State<CashBookingCODReport> {
  @override
  Widget build(BuildContext context) => const ReportPage(
    title: 'Cash booking and COD report',
    rows: [
      ['Cash bookings', '38', '₹64,240'],
      ['COD collected', '29', '₹48,680'],
      ['Pending handover', '8', '₹6,420'],
    ],
  );
}
