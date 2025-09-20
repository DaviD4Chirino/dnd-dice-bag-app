import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:dice_bag/modules/home/modules/dice_roll/pages/dice_roll_page.dart';
import 'package:dice_bag/modules/home/modules/roll_history/pages/roll_history_page.dart';
import 'package:dice_bag/tokens/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var t = strings.modules.home;

    var tabBarController = useTabController(initialLength: 2);

    // AppLocalizations t = AppLocalizations.of(context);
    final t = strings.modules.home;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.appName),
        bottom: TabBar(
          controller: tabBarController,
          tabs: [
            Tab(text: t.tabs.dice),
            Tab(text: t.tabs.history),
          ],
        ),
        actions: [
          /* IconButton(
            tooltip: strings.modules.settings.title,
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_rounded),
          ), */
          IconButton(
            tooltip: strings.modules.settings.title,
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.settings),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: TabBarView(
        controller: tabBarController,
        children: const [DiceRollPage(), RollHistoryPage()],
      ),
    );
  }
}
