import 'package:flutter/material.dart';

class CoLoaderReport extends StatefulWidget {
  const CoLoaderReport({super.key});

  @override
  State<CoLoaderReport> createState() => _CoLoaderReportState();
}

class _CoLoaderReportState extends State<CoLoaderReport> {
  @override
  Widget build(BuildContext context) => ReportPage(
    title: 'Co-loader report',
    rows: const [
      ['Delhivery', '42 orders', '₹18,420'],
      ['DHL', '12 orders', '₹32,680'],
      ['FedEx', '8 orders', '₹14,210'],
    ],
  );
}

class ReportPage extends StatelessWidget {
  const ReportPage({required this.title, required this.rows, super.key});
  final String title;
  final List<List<String>> rows;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFF5F7FF),
    body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(11, 4, 11, 24), child: Column(children: [
      _ReportHeader(title: title), const SizedBox(height: 18), const _FilterBar(), const SizedBox(height: 24),
      _TableHeader(), ...rows.map((r) => _TableRow(values: r)), const SizedBox(height: 148), const _ReportActions(),
    ]))),
  );
}

class _ReportHeader extends StatelessWidget { const _ReportHeader({required this.title}); final String title; @override Widget build(BuildContext context) => Container(height: 57, padding: const EdgeInsets.symmetric(horizontal: 7), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17), boxShadow: const [BoxShadow(color: Color(0x180D1D68), blurRadius: 10, offset: Offset(0, 4))]), child: Row(children: [Container(width: 36, height: 36, decoration: const BoxDecoration(color: Color(0xFFFFD632), shape: BoxShape.circle), child: const Icon(Icons.chevron_left, size: 20, color: Color(0xFF17276D))), const SizedBox(width: 10), Expanded(child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800))), Container(width: 38, height: 4, decoration: BoxDecoration(color: const Color(0xFFFFC800), borderRadius: BorderRadius.circular(3))) ])); }
class _FilterBar extends StatelessWidget { const _FilterBar(); @override Widget build(BuildContext context) => Container(height: 50, padding: const EdgeInsets.symmetric(horizontal: 18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: const [BoxShadow(color: Color(0x160D1D68), blurRadius: 10, offset: Offset(0, 5))]), child: Row(children: [const Expanded(child: Text('17 Sep - 19 Sep 2026 · All statuses', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600))), const Text('Filter', style: TextStyle(color: Color(0xFF12259A), fontSize: 10, fontWeight: FontWeight.w700))])); }
class _TableHeader extends StatelessWidget { @override Widget build(BuildContext context) => Container(height: 52, padding: const EdgeInsets.symmetric(horizontal: 18), decoration: const BoxDecoration(color: Color(0xFF172477), borderRadius: BorderRadius.vertical(top: Radius.circular(14), bottom: Radius.circular(14))), child: const Row(children: [Expanded(child: Text('Category', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700))), SizedBox(width: 52, child: Text('Count', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700))), SizedBox(width: 82, child: Text('Amount / result', textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700))) ])); }
class _TableRow extends StatelessWidget { const _TableRow({required this.values}); final List<String> values; @override Widget build(BuildContext context) => Container(height: 58, padding: const EdgeInsets.symmetric(horizontal: 18), color: const Color(0xFFFDFEFF), child: Row(children: [Expanded(child: Text(values[0], style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600))), SizedBox(width: 52, child: Text(values[1], style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600))), SizedBox(width: 82, child: Text(values[2], textAlign: TextAlign.right, style: const TextStyle(color: Color(0xFF12259A), fontSize: 11, fontWeight: FontWeight.w700))) ])); }
class _ReportActions extends StatelessWidget { const _ReportActions(); @override Widget build(BuildContext context) => Column(children: [Container(height: 53, decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF263694), Color(0xFF4059D2)]), borderRadius: BorderRadius.circular(17)), child: const Row(children: [SizedBox(width: 16), Text('▌', style: TextStyle(color: Color(0xFFFFD000), fontSize: 24)), Expanded(child: Center(child: Text('Download or share report', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800)))), Padding(padding: EdgeInsets.only(right: 18), child: Text('›', style: TextStyle(color: Color(0xFFFFD000), fontSize: 27, fontWeight: FontWeight.w800))) ])), const SizedBox(height: 11), SizedBox(height: 54, child: OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFF12259A), width: 1.5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('Print branch copy', style: TextStyle(color: Color(0xFF12259A), fontSize: 14, fontWeight: FontWeight.w800))))]); }
