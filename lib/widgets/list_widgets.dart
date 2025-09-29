import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/my_app_state.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class ListWidgets extends StatefulWidget {
  const ListWidgets({
    super.key,
    required this.title,
    this.imageAvatar,
    this.lastChat,
    this.notification,
    this.date,
    this.imageProfil =
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
  });
  final String title;
  final NetworkImage? imageAvatar;
  final String? lastChat;
  final String? notification;
  final String? date;
  final String? imageProfil;
  @override
  State<ListWidgets> createState() => _ListWidgetsState();
}

class _ListWidgetsState extends State<ListWidgets> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appSate = context.watch<MyAppState>();
    final title = widget.title;
    final lastChat = widget.lastChat;
    final date = widget.date;
    final notification = widget.notification;

    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.imageProfil ?? ''),
            backgroundColor: theme.colorScheme.secondary,
            maxRadius: 25,
          ),

          title: Text(title),
          subtitle: Text(lastChat ?? ''),
          trailing: Column(
            children: [
              if (date != null)
                Text(date.toString(), style: TextStyle(color: Colors.green)),
              SizedBox(height: 10),
              if (notification != null)
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10, end: -10),
                  badgeContent: Text(
                    notification,
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.green,
                    padding: EdgeInsets.all(4),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
