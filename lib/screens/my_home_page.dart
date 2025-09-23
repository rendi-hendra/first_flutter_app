import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/status_page.dart';
import 'package:flutter_application_1/state/my_app_state.dart';
import 'package:flutter_application_1/widgets/chat_list.dart';
import 'package:flutter_application_1/widgets/floating_action_button.dart';
import 'package:flutter_application_1/widgets/grouping_chat.dart';
import 'package:flutter_application_1/widgets/search_bar.dart';
import 'package:flutter_application_1/widgets/top_app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: TopAppBar(),
      backgroundColor: theme.colorScheme.primary,
      body: PageView(
        onPageChanged: (value) => appState.setPageCount(value),

        children: <Widget>[
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
          StatusPage(),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
      bottomSheet: Container(height: 1, color: theme.colorScheme.secondary),
      floatingActionButton: FloatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
