import 'package:flutter/material.dart';
import 'package:yogayogbranch/coloaderreport/coloaderreport.dart';

class DeliveryRunSheet extends StatefulWidget {
  const DeliveryRunSheet({super.key});

  @override
  State<DeliveryRunSheet> createState() => _DeliveryRunSheetState();
}

class _DeliveryRunSheetState extends State<DeliveryRunSheet> {
  @override
  Widget build(BuildContext context) => const ReportPage(
    title: 'Delivery run sheet',
    rows: [
      ['Arjun Kumar', '18 stops', '14 delivered'],
      ['Suman Roy', '12 stops', '8 delivered'],
      ['Ravi Logistics', '6 stops', '4 delivered'],
    ],
  );
}
