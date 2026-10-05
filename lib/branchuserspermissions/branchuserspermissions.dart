import 'package:flutter/material.dart';

class BranchUsersPermissions extends StatefulWidget {
  const BranchUsersPermissions({super.key});

  @override
  State<BranchUsersPermissions> createState() => _BranchUsersPermissionsState();
}

class _BranchUsersPermissionsState extends State<BranchUsersPermissions> {
  static const _pageBackground = Color(0xFFF5F7FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: Stack(
        children: [
          const _UsersBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(5, 4, 5, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  _buildSearchBar(),
                  const SizedBox(height: 24),
                  _buildUserRow('P', 'Priya Sen', 'Manager · All permitted modules'),
                  const SizedBox(height: 10),
                  _buildUserRow('R', 'Rohit Das', 'Booking operator · No finance'),
                  const SizedBox(height: 10),
                  _buildUserRow('M', 'Mina Roy', 'Finance checker · Read + approve'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 57,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: const [BoxShadow(color: Color(0x180D1D68), blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Row(children: [
        Container(width: 36, height: 36, decoration: const BoxDecoration(color: Color(0xFFFFD632), shape: BoxShape.circle), child: const Icon(Icons.chevron_left, size: 20, color: Color(0xFF17276D))),
        const SizedBox(width: 10),
        const Expanded(child: Text('Branch users and permissions', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800))),
        Container(height: 28, padding: const EdgeInsets.symmetric(horizontal: 14), decoration: BoxDecoration(color: const Color(0xFFFFF5CA), borderRadius: BorderRadius.circular(15)), child: const Center(child: Text('Filter', style: TextStyle(color: Color(0xFF12259A), fontSize: 10, fontWeight: FontWeight.w800)))),
      ]),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(left: 24, right: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: const [BoxShadow(color: Color(0x120D1D68), blurRadius: 9, offset: Offset(0, 4))]),
      child: Row(children: [
        const Expanded(child: Text('Search and filter records', style: TextStyle(color: Color(0xFF71809E), fontSize: 12))),
        Container(height: 28, padding: const EdgeInsets.symmetric(horizontal: 17), decoration: BoxDecoration(color: const Color(0xFFFFF5CA), borderRadius: BorderRadius.circular(16)), child: const Center(child: Text('3 shown', style: TextStyle(color: Color(0xFF12259A), fontSize: 10, fontWeight: FontWeight.w800)))),
      ]),
    );
  }

  Widget _buildUserRow(String iconLabel, String name, String details) {
    return Container(
      height: 74,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(color: const Color(0xFFF9FBFF).withValues(alpha: 0.9), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFDCE3F0))),
      child: Row(children: [
        Container(width: 30, height: 30, decoration: const BoxDecoration(color: Color(0xFFE1F3ED), shape: BoxShape.circle), alignment: Alignment.center, child: Text(iconLabel, style: const TextStyle(color: Color(0xFF168B68), fontSize: 11, fontWeight: FontWeight.w800))),
        const SizedBox(width: 14),
        Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w800)), const SizedBox(height: 5), Text(details, style: const TextStyle(color: Color(0xFF52678F), fontSize: 9))])),
        Container(width: 76, height: 26, alignment: Alignment.center, decoration: BoxDecoration(color: const Color(0xFFDDF0EB), borderRadius: BorderRadius.circular(15)), child: const Text('ACTIVE', style: TextStyle(color: Color(0xFF168B68), fontSize: 9, fontWeight: FontWeight.w800))),
      ]),
    );
  }
}

class _UsersBackground extends StatelessWidget {
  const _UsersBackground();
  @override
  Widget build(BuildContext context) => IgnorePointer(child: Stack(children: [
    Positioned(top: -53, right: -24, child: Container(width: 130, height: 180, decoration: const BoxDecoration(color: Color(0xFFE9EDFF), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))))),
    Positioned(top: 390, left: -49, child: Container(width: 97, height: 97, decoration: const BoxDecoration(color: Color(0xFFFFF1B5), shape: BoxShape.circle))),
    Positioned(bottom: 11, left: 17, child: Container(width: 40, height: 40, decoration: const BoxDecoration(color: Color(0xFFE3F5F0), shape: BoxShape.circle))),
  ]));
}
