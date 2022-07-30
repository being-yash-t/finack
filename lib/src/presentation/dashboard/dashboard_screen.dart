import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:finack/src/core/constants/firebase.dart';
import 'package:finack/src/features/expenses/presentation/pages/expenses_page.dart';
import 'package:finack/src/features/journal/presentation/pages/journal_page.dart';
import 'package:finack/src/features/overview/presentation/pages/overview_page.dart';
import 'package:finack/src/features/settings/presentation/pages/settings_page.dart';
import 'package:finack/src/presentation/custom_widgets/bottom_navigation_bar.dart';
import 'package:finack/src/presentation/custom_widgets/dashboard_scaffold.dart';
import 'package:finack/src/presentation/routing/router.gr.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static List<Widget>? get getActions => [];
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      duration: animationDuration,
      lazyLoad: true,
      routes: const [
        OverviewRouter(),
        JournalRouter(),
        ExpensesRouter(),
        SettingsRouter(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return LayoutBuilder(
          builder: (context, dimens) {
            // Tablet Layout
            if (dimens.maxWidth >= 600) {
              // Add this line
              return Scaffold(
                body: Row(
                  children: [
                    NavigationRail(
                      extended: dimens.maxWidth >= 800,
                      minExtendedWidth: 180,
                      onDestinationSelected: tabsRouter.setActiveIndex,
                      selectedIndex: tabsRouter.activeIndex,
                      destinations:
                          _getBottomNavbarItems(tabsRouter.activeIndex)
                              .map(
                                (NavigationDestination e) =>
                                    NavigationRailDestination(
                                  icon: e.icon,
                                  label: Text(e.label),
                                ),
                              )
                              .toList(),
                    ),
                    Expanded(child: child),
                  ],
                ),
              );
            } // Add this line

            // Mobile Layout
            // Add from here...
            return DashboardScaffold(
              drawer: const Drawer(),
              // TODO: replace with fade through transition
              body: FadeTransition(
                opacity: animation,
                child: child,
              ),
              bottomBar: NavigationBar(
                onDestinationSelected: tabsRouter.setActiveIndex,
                selectedIndex: tabsRouter.activeIndex,
                destinations: _getBottomNavbarItems(tabsRouter.activeIndex),
              ),
            );
          },
        );
      },
    );
  }

  List<NavigationDestination> _getBottomNavbarItems(int activeIndex) => [
        NavigationDestination(
          icon: activeIndex == 0
              ? const Icon(FluentIcons.board_20_filled, key: Key('1 active'))
              : const Icon(
                  FluentIcons.board_20_regular,
                  key: Key('1 inActive'),
                ),
          label: 'Overview',
        ),
        NavigationDestination(
          icon: activeIndex == 1
              ? const Icon(FluentIcons.notebook_24_filled, key: Key('2 active'))
              : const Icon(
                  FluentIcons.notebook_24_regular,
                  key: Key('2 inActive'),
                ),
          label: 'Journal',
        ),
        NavigationDestination(
          icon: activeIndex == 2
              ? const Icon(FluentIcons.money_20_filled, key: Key('3 active'))
              : const Icon(
                  FluentIcons.money_20_regular,
                  key: Key('3 inActive'),
                ),
          label: 'Expenses',
        ),
        NavigationDestination(
          icon: activeIndex == 3
              ? const Icon(FluentIcons.settings_20_filled, key: Key('4 active'))
              : const Icon(
                  FluentIcons.settings_20_regular,
                  key: Key('4 inActive'),
                ),
          label: 'Settings',
        ),
      ];
}
