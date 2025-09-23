import 'package:flutter/material.dart';

class GroupingChat extends StatelessWidget {
  const GroupingChat({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        height: 35,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) => TextButton(
            onPressed: () {},
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
