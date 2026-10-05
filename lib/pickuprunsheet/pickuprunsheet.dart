import 'package:flutter/material.dart';
import 'package:yogayogbranch/coloaderreport/coloaderreport.dart';

class PickupRunSheet extends StatefulWidget {
  const PickupRunSheet({super.key});

  @override
  State<PickupRunSheet> createState() => _PickupRunSheetState();
}

class _PickupRunSheetState extends State<PickupRunSheet> {
  @override
  Widget build(BuildContext context) => const ReportPage(
    title: 'Pickup run sheet',
    rows: [
      ['North Kolkata', '8 pickups', '6 done'],
      ['Salt Lake', '12 pickups', '9 done'],
      ['Howrah', '6 pickups', '5 done'],
    ],
  );
}
