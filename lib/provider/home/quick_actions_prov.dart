import 'package:flutter/material.dart';
import 'package:tobo_apk/main.dart';
import 'package:tobo_apk/model/quick_actions_model.dart';

class QuickActionsProv extends ChangeNotifier {
  final List<QuickActionsModel> quickActions = [
    QuickActionsModel(
      title: 'Interior',
      iconPath: 'assets/svgs/sofa.svg',
      linkPage: AppRoutes.konstruksiRingan,
    ),
    QuickActionsModel(
      title: 'Renovasi',
      iconPath: 'assets/svgs/kuas.svg',
      linkPage: AppRoutes.konstruksiRingan,
    ),
    QuickActionsModel(
      title: 'Konstruksi Ringan',
      iconPath: 'assets/svgs/konstruksi.svg',
      linkPage: AppRoutes.konstruksiRingan,
    ),
    QuickActionsModel(
      title: 'Katalog Produk',
      iconPath: 'assets/svgs/katalog.svg',
      linkPage: AppRoutes.konstruksiRingan,
    ),
  ];

  void onTap(int index, BuildContext context) {
    final quickAction = quickActions[index];
    Navigator.pushNamed(context, quickAction.linkPage);
  }
}
