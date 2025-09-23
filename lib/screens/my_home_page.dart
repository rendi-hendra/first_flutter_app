import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/chat_list.dart';
import 'package:flutter_application_1/widgets/floating_action_button.dart';
import 'package:flutter_application_1/widgets/grouping_chat.dart';
import 'package:flutter_application_1/widgets/search_bar.dart';
import 'package:flutter_application_1/widgets/top_app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_bar.dart';
import 'package:badges/badges.dart' as badges;

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);
    // final user = MyAppState();

    return Scaffold(
      appBar: TopAppBar(),
      backgroundColor: theme.colorScheme.primary,
      body: PageView(
        controller: PageController(viewportFraction: 1),
        children: [
          Column(
            children: [
              SearchBarApp(),
              GroupingChat(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ChatList(),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  ),
                  Text(
                    'Status',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  ),
                  badges.Badge(
                    position: badges.BadgePosition.bottomEnd(
                      bottom: 1,
                      end: -3,
                    ),
                    badgeContent: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Colors.green,
                      padding: EdgeInsets.all(4),
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                      ),
                      backgroundColor: theme.colorScheme.secondary,
                      maxRadius: 25,
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Status',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Disappear after 24 hours',
                        style: TextStyle(
                          color: theme.colorScheme.secondaryFixed.withValues(
                            alpha: 0.7,
                          ),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Viewed updates'),
                iconColor: theme.colorScheme.secondaryFixed,
                shape: Border(
                  top: BorderSide(color: theme.colorScheme.primary, width: 0),
                  bottom: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 0,
                  ),
                ),
                children: [
                  ListTile(title: SizedBox(height: 554, child: ChatList())),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
      bottomSheet: Container(height: 1, color: theme.colorScheme.secondary),
      floatingActionButton: FloatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
