import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:dice_bag/tokens/app/app_routes.dart';
import 'package:dice_bag/tokens/models/enums/die_faces.dart';
import 'package:dice_bag/tokens/atoms/polymath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    var t = strings.modules.home;
    final ThemeData theme = Theme.of(context);

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        tooltip: t.FABTooltip,
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Center(
            child: Polymath.filled(
              "9999",
              faces: DieFaces.d20,
              style: theme.textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
