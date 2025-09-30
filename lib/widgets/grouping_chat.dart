import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/my_app_state.dart';
import 'package:provider/provider.dart';

class GroupingChat extends StatelessWidget {
  const GroupingChat({super.key});
  @override
  Widget build(BuildContext context) {
    var appSate = context.watch<MyAppState>();
    var currentGroup = appSate.currentGroup;
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        height: 35,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) => TextButton(
            onPressed: () {
              appSate.setCurrentGroup(i);
              print(appSate.currentGroup);
            },
            style: TextButton.styleFrom(
              backgroundColor: i == currentGroup
                  ? Colors.green.withAlpha(150)
                  : Colors.transparent,
            ),
            child: Text(
              ['All', 'Unread 20', 'Favourites', 'Groups 13', '+'][i],
            ),
          ),
          separatorBuilder: (_, _) => SizedBox(width: 10),
          itemCount: 5,
        ),
      ),
    );
  }
}
