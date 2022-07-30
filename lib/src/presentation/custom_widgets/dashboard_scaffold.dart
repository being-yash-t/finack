import 'package:flutter/material.dart';

class DashboardScaffold extends Scaffold {
  final List<Widget> actions;

  static DashboardScaffoldState? of(BuildContext context) =>
      context.findAncestorStateOfType<DashboardScaffoldState>();

  const DashboardScaffold({
    Key? key,
    Widget? drawer,
    Widget? endDrawer,
    required Widget body,
    this.actions = const [],
    required Widget bottomBar,
  }) : super(
          key: key,
          body: body,
          drawer: drawer,
          endDrawer: endDrawer,
          bottomNavigationBar: bottomBar,
          resizeToAvoidBottomInset: false,
        );

  @override
  ScaffoldState createState() => DashboardScaffoldState();
}

// DashboardScaffold.hasDrawer may not return correct value if this is removed
// because there may be another scaffoldState in between the caller
// & DashboardScaffold.
class DashboardScaffoldState extends ScaffoldState {}
