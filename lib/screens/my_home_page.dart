import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/top_app_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);

    return Scaffold(
      appBar: TopAppBar(),
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15), // ✅
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        cursorColor: theme.colorScheme.secondaryFixed,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsetsGeometry.directional(
                              start: 20,
                              end: 5,
                            ),
                            child: Icon(Icons.search),
                          ),
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            color: theme.colorScheme.secondaryFixed.withValues(
                              alpha: 0.5,
                            ),
                          ),
                          filled: true,
                          fillColor: theme.colorScheme.secondary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  separatorBuilder: (_, __) => SizedBox(width: 10),
                  itemCount: 5,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ListView.separated(
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
                          'Rendi',
                          'Prabowo',
                          'Jokowi',
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
                          'test',
                          'test',
                          'test',
                          'test',
                          'test',
                          'test',
                        ][i],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: theme.colorScheme.secondaryFixed.withValues(
                            alpha: 0.7,
                          ),
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
                              ['1', '50', '90', '10', '20', '80', '2', '5'][i],
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (_, __) => SizedBox(width: 10),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: FloatingActionButton(
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
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        // shape: const CircleBorder(),
        backgroundColor: Colors.green,
        elevation: 0,
        splashColor: Colors.white,
        tooltip: 'Alert Dialog',
        child: Icon(MdiIcons.messagePlus, color: theme.colorScheme.onPrimary),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
