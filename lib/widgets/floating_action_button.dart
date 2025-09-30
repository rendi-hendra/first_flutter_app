import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/state/my_app_state.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    return FloatingActionButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.pop(context, 'OK'),
                appState.setListChat('Wowo', 'MBG', 'Yesterday', '1'),
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      // shape: const CircleBorder(),
      backgroundColor: Colors.green,
      elevation: 0,
      tooltip: 'Alert Dialog',
      child: Icon(MdiIcons.messagePlus, color: theme.colorScheme.onPrimary),
    );
  }
}
