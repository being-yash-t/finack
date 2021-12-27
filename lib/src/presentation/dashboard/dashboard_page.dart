import 'package:auto_route/auto_route.dart';
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: _getBottomNavbarItems(),
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _getBottomNavbarItems() => const [
        BottomNavigationBarItem(
          icon: Icon(FluentIcons.board_20_regular),
          label: 'Overview',
        ),
        BottomNavigationBarItem(
          icon: Icon(FluentIcons.notebook_24_regular),
          label: 'Journal',
        ),
        BottomNavigationBarItem(
          icon: Icon(FluentIcons.money_20_regular),
          label: 'Expenses',
        ),
        BottomNavigationBarItem(
          icon: Icon(FluentIcons.settings_20_regular),
          label: 'Settings',
        ),
      ];
}
