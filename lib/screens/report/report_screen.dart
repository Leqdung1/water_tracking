import 'package:flutter/material.dart';
import 'package:water_tracking/widgets/appbar/app_appbar.dart';

import '../../i18n/strings.g.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: t.core.report),
      body: Center(
        child: Text('Report'),
      ),
    );
  }
}
