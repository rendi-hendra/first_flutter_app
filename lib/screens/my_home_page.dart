import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/status_page.dart';
import 'package:flutter_application_1/state/my_app_state.dart';
import 'package:flutter_application_1/widgets/floating_action_button.dart';
import 'package:flutter_application_1/widgets/grouping_chat.dart';
import 'package:flutter_application_1/widgets/list_widgets.dart';
import 'package:flutter_application_1/widgets/search_bar.dart';
import 'package:flutter_application_1/widgets/top_app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final PageController _pageController;
  final List<Map<String, dynamic>> _appBarConfig = [
    {
      'title': 'WhatsApp',
      'firstIcon': Icons.camera_alt_outlined,
      'secondIcon': Icons.more_vert,
      'style': null,
    },
    {
      'title': 'Updates',
      'firstIcon': Icons.search,
      'secondIcon': Icons.more_vert,
      'style': TextStyle(fontStyle: FontStyle.normal),
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);
    final currentPage = appState.pageCount;
    final config = _appBarConfig[currentPage];
    final getAllUser = appState.getAllUsers();
    final selectChat = appState.selectChat;

    return Scaffold(
      appBar: TopAppBar(
        title: config['title'],
        style: config['style'],
        firstIcon: config['firstIcon'],
        secondIcon: config['secondIcon'],
        onFirstPressed: () => {
          appState.addChatAll(appState.listChat),
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Add'))),
        },
        onSecondPressed: () => appState.removeAllChat(),
      ),
      backgroundColor: theme.colorScheme.primary,
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) => {appState.setPageCount(value)},
        children: <Widget>[
          Column(
            children: [
              SearchBarApp(),
              GroupingChat(),
              Expanded(
                child: ListView.separated(
                  itemCount: getAllUser.length,
                  itemBuilder: (BuildContext contex, int index) {
                    return GestureDetector(
                      onLongPress: (() => {
                        appState.setSelectChat(index),
                        print(selectChat),
                        // if (selectChat == index)
                        //   {appState.setSelectChat(null)}
                        // else
                        //   {appState.setSelectChat(index)},
                      }),
                      child: Column(
                        children: [
                          Card(
                            color: selectChat.isNotEmpty
                                ? Colors.green.withAlpha(80)
                                : Colors.transparent,
                            // color: [Colors.green.withAlpha(80)][index],
                            shape: Border.all(style: BorderStyle.none),
                            elevation: 0,
                            margin: EdgeInsets.symmetric(),
                            child: ListWidgets(
                              title: getAllUser[index]['title'],
                              lastChat: getAllUser[index]['lastChat'],
                              date: getAllUser[index]['date'],
                              notification: getAllUser[index]['notification'],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 15),
                ),
              ),
            ],
          ),
          StatusPage(),
        ],
      ),
      bottomNavigationBar: BottomBar(pageController: _pageController),
      bottomSheet: Container(height: 1, color: theme.colorScheme.secondary),
      floatingActionButton: FloatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
