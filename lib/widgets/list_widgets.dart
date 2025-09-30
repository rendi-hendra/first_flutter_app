import 'package:flutter/material.dart';

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
    // var appSate = context.watch<MyAppState>();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (date != null)
                    Text(
                      date,
                      style: TextStyle(
                        color: notification != null
                            ? Colors.green
                            : Colors.white,
                      ),
                    ),
                  SizedBox(height: 10),
                  if (notification != null)
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green,
                      child: Text(notification, style: TextStyle(fontSize: 12)),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
