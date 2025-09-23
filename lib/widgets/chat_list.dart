import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      itemCount: 8,
      itemBuilder: (_, i) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
            ),
            backgroundColor: theme.colorScheme.secondary,
            maxRadius: 25,
          ),
          title: Text(
            [
              'Fufufafa',
              'Wowo',
              'Mulyono',
              'Mark Zuckerberg',
              'WhatsApp',
              'Group Programmer',
              'Group Android Dev',
              'Group Flutter Dev',
            ][i],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            [
              'test',
              'test',
              'Otw IKN',
              'test',
              'test',
              'test',
              'test',
              'test',
            ][i],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: theme.colorScheme.secondaryFixed.withValues(alpha: 0.7),
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                [
                  'Today',
                  'Today',
                  'Today',
                  'Today',
                  'Today',
                  'Today',
                  'Today',
                  'Today',
                ][i],
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.green,
                child: Text(
                  ['1', '50', '1', '10', '20', '80', '2', '5'][i],
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (_, _) => SizedBox(width: 10),
    );
  }
}
