import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:dice_bag/tokens/app/app_routes.dart';
import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/die_button.dart';
import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var t = strings.modules.home;

    // AppLocalizations t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.title),
        actions: [
          IconButton(
            tooltip: strings.modules.settings.title,
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.settings),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1024),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: AppSizing.lg,
                left: AppSizing.sm,
                right: AppSizing.sm,
                bottom: AppSizing.lg,
              ),
              child: FlexibleWrap(
                spacing: AppSizing.xs,
                runSpacing: AppSizing.xs,
                children: [
                  DieButton(onPressed: null),
                  DieButton(onPressed: null),
                  DieButton(onPressed: null),
                  DieButton(onPressed: null),
                  DieButton(onPressed: null),
                  DieButton(onPressed: null),
                  DieButton(onPressed: null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
