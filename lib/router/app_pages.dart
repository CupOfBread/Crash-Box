import 'package:crash_box/pages/dashboard/view.dart';
import 'package:crash_box/pages/portfolio_instruction/view.dart';
import 'package:get/get.dart';

import '../pages/home/view.dart';
import '../pages/login/view.dart';
import '../pages/my/view.dart';
import '../pages/portfolio/view.dart';
import '../pages/portfolio_cleared/view.dart';
import '../pages/portfolio_detail/view.dart';

class AppPages {
  static const INITIAL = '/home';

  static final routes = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
    ),
    GetPage(
      name: '/portfolio',
      page: () => PortfolioPage(),
    ),
    GetPage(
      name: '/portfolio/detail',
      page: () => PortfolioDetailPage(),
    ),
    GetPage(
      name: '/portfolio/instruction',
      page: () => PortfolioInstructionPage(),
    ),
    GetPage(
      name: '/portfolio/cleared',
      page: () => PortfolioClearedPage(),
    ),
    GetPage(
      name: '/my',
      page: () => MyPage(),
    ),
    GetPage(
      name: '/dashboard',
      page: () => DashboardPage(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
  ];
}
