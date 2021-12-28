import 'package:auto_route/auto_route.dart';
import 'package:finack/src/presentation/dashboard/widgets/bottom_navigation_bar.dart';
import 'package:finack/src/presentation/routing/router.gr.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        OverviewRouter(),
        JournalRouter(),
        ExpensesRouter(),
        SettingsRouter(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          // TODO: replace with fade through transition
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: CBottomNavBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: _getBottomNavbarItems(tabsRouter.activeIndex),
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _getBottomNavbarItems(int activeIndex) => [
        BottomNavigationBarItem(
          icon: activeIndex == 0
              ? const Icon(FluentIcons.board_20_filled)
              : const Icon(FluentIcons.board_20_regular),
          label: 'Overview',
        ),
        BottomNavigationBarItem(
          icon: activeIndex == 1
              ? const Icon(FluentIcons.notebook_24_filled)
              : const Icon(FluentIcons.notebook_24_regular),
          label: 'Journal',
        ),
        BottomNavigationBarItem(
          icon: activeIndex == 2
              ? const Icon(FluentIcons.money_20_filled)
              : const Icon(FluentIcons.money_20_regular),
          label: 'Expenses',
        ),
        BottomNavigationBarItem(
          icon: activeIndex == 3
              ? const Icon(FluentIcons.settings_20_filled)
              : const Icon(FluentIcons.settings_20_regular),
          label: 'Settings',
        ),
      ];
}
