import 'package:flutter/material.dart';

import '../utils/customappbar.dart';
import 'widget/dropdowndetails.dart';

class RoleSelection extends StatefulWidget {
  const RoleSelection({super.key});

  @override
  State<RoleSelection> createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Select Role Screen'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectRoledropdown(),
            SizedBox(height: 20),
            Branchdetails(),
            SizedBox(height: 20),
            warehousedetailsdropdown(),
            SizedBox(height: 20),
            centerdetailsdropdown(),
          ],
        ),
      ),
    );
  }
}
