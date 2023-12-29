import 'package:crash_box/pages/dashboard/view.dart';
import 'package:flutter/cupertino.dart';

import '../my/view.dart';
import '../portfolio/view.dart';

class HomeState {
  List<Widget> pages = [DashboardPage(), PortfolioPage(), MyPage()];

  HomeState() {}
}
