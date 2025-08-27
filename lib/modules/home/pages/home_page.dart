import 'package:awesome_flutter_template/i18n/gen/strings.g.dart';
import 'package:awesome_flutter_template/tokens/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        tooltip: t.FABTooltip,
        child: const Icon(Icons.add),
      ),
      body: Center(child: Text(t.counter(n: counter.value))),
    );
  }
}
