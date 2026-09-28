import 'package:flutter/material.dart';
import 'package:yogayogbranch/branchassistedbookinghub/branchassistedbookinghub.dart';
import 'package:yogayogbranch/serviceordersbiketruckserviceorders/serviceordersbiketruckserviceorders.dart';
import 'package:yogayogbranch/ridersriderdirectory/ridersriderdirectory.dart';
import 'package:yogayogbranch/assignedordersassignedorderqueue/assignedordersassignedorderqueue.dart';
import 'package:yogayogbranch/connectmanualconnectshipmentmanually/connectmanualconnectshipmentmanually.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 18),
              const Text(
                'More tools',
                style: TextStyle(
                  color: Color(0xFF33456D),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _buildMenuItem(),
              const SizedBox(height: 10),
              _buildServiceOrdersItem(),
              const SizedBox(height: 10),
              _buildRiderDirectoryItem(),
              const SizedBox(height: 10),
              _buildAssignedOrdersItem(),
              const SizedBox(height: 10),
              _buildConnectShipmentItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 12),
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
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD43B),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.more_horiz,
              color: Color(0xFF16358E),
              size: 20,
            ),
          ),
          const SizedBox(width: 11),
          const Text(
            'More',
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

  Widget _buildMenuItem() {
    return Material(
      color: const Color(0xFFF9FAFF),
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const BranchAssistedBookingHub()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFFDDE3F0)),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF26369E).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.hub_outlined,
                  color: Color(0xFF26369E),
                  size: 21,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Branch-assisted booking hub',
                      style: TextStyle(
                        color: Color(0xFF0B0D13),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Manage assisted bookings from one place',
                      style: TextStyle(color: Color(0xFF4B5A7B), fontSize: 9),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF26369E),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceOrdersItem() {
    return Material(
      color: const Color(0xFFF9FAFF),
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const ServiceOrdersBikeTruckServiceOrders(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFFDDE3F0)),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF16A16D).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.two_wheeler_outlined,
                  color: Color(0xFF168B68),
                  size: 21,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service orders',
                      style: TextStyle(
                        color: Color(0xFF0B0D13),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Manage bike and truck service orders',
                      style: TextStyle(color: Color(0xFF4B5A7B), fontSize: 9),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF168B68),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRiderDirectoryItem() {
    return Material(
      color: const Color(0xFFF9FAFF),
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const RidersRiderDirectory()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFFDDE3F0)),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF16A16D).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.groups_outlined,
                  color: Color(0xFF168B68),
                  size: 21,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rider directory',
                      style: TextStyle(
                        color: Color(0xFF0B0D13),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'View and manage riders',
                      style: TextStyle(color: Color(0xFF4B5A7B), fontSize: 9),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF168B68),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAssignedOrdersItem() {
    return Material(
      color: const Color(0xFFF9FAFF),
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AssignedOrdersAssignedOrderQueue(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFFDDE3F0)),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF26369E).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.assignment_outlined,
                  color: Color(0xFF26369E),
                  size: 21,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assigned orders',
                      style: TextStyle(
                        color: Color(0xFF0B0D13),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'View and manage the order queue',
                      style: TextStyle(color: Color(0xFF4B5A7B), fontSize: 9),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF26369E),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectShipmentItem() {
    return Material(
      color: const Color(0xFFF9FAFF),
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const ConnectManualConnectShipmentManually(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFFDDE3F0)),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF26369E).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.link_outlined,
                  color: Color(0xFF26369E),
                  size: 21,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connect shipment manually',
                      style: TextStyle(
                        color: Color(0xFF0B0D13),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Link a shipment to a branch or route',
                      style: TextStyle(color: Color(0xFF4B5A7B), fontSize: 9),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF26369E),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
