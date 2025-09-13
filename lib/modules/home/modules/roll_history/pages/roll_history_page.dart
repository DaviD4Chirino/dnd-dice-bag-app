import 'dart:math';

import 'package:dice_bag/extensions/double_extensions/sized_box_extension.dart';
import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:flutter/material.dart';

class RollHistoryPage extends StatelessWidget {
  const RollHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final resultsInts = List.generate(
      301,
      (index) => Random().nextInt(100),
    );
    final results = resultsInts.map((element) => "$element");

    final resultString = results.join(" | ");

    final generatedList = List.generate(
      15,
      (index) => ListTile(
        leading: Polymath.filled(
          resultsInts
              .reduce((value, element) => value + element)
              .toString(),
          style: theme.textTheme.bodyLarge,
          padding: 5,
        ),
        title: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text("99D20 (+15998732554545)"),
              ),
            ),
            AppSpacing.sm.sizedBoxW,
            Text(
              "13/09 6:40PM",
              style: theme.textTheme.labelSmall,
            ),
          ],
        ),
        subtitle: Container(
          constraints: BoxConstraints(maxHeight: 60),
          child: SingleChildScrollView(
            child: Text(resultString),
          ),
        ),
      ),
    );
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) => generatedList[index],
        separatorBuilder: (context, index) => Divider(),
        itemCount: generatedList.length,
      ),
    );
  }
}
