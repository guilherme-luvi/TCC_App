import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_2021/screens/user/cronograma_page.dart';
import 'package:tcc_2021/screens/user/health_page.dart';
import 'package:tcc_2021/screens/user/history_page.dart';
import 'package:tcc_2021/screens/user/home_page.dart';
import 'package:tcc_2021/screens/user/minha_conta_page.dart';

// ignore: must_be_immutable
class TabsPage extends StatefulWidget {
  int _currentIndex;

  TabsPage(this._currentIndex);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF6EB0ED),
    ));

    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Brazil Health",
            style: TextStyle(color: Color(0xFF6EB0ED)),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: Colors.black,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Nilesh Rathod"),
              accountEmail: Text("nilesh@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset('images/user.png'),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person_add),
                ),
              ],
            ),
            ListTile(
              title: Text('Minha Conta'),
              trailing: Icon(Icons.account_circle),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MinhaConta(),
                  ),
                );
              },
            ),
            Divider(
              color: Colors.blueGrey,
            ),
            ListTile(
              title: Text('Cronograma'),
              trailing: Icon(Icons.calendar_today_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CronogramaListPage(),
                  ),
                );
              },
            ),
            Divider(
              color: Colors.blueGrey,
            ),
            ListTile(
              title: Text('Locais e Mapas'),
              trailing: Icon(Icons.location_on),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.blueGrey,
            ),
            ListTile(
              title: Text('Contato'),
              trailing: Icon(Icons.add_call),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.blueGrey,
            ),
            ListTile(
              title: Text('Sair'),
              trailing: Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
      body: TabNavigationItem.items[widget._currentIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF6EB0ED),
        selectedItemColor: Colors.white,
        selectedFontSize: 16,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.white70,
        currentIndex: widget._currentIndex,
        onTap: (int index) => setState(() => widget._currentIndex = index),
        items: [
          for (final tabItem in TabNavigationItem.items)
            BottomNavigationBarItem(
              icon: tabItem.icon,
              label: tabItem.title.toString(),
            )
        ],
      ),
    );
  }
}

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomePage(),
          icon: Icon(Icons.home),
          title: "Início",
        ),
        TabNavigationItem(
          page: HealthPage(),
          icon: Icon(Icons.favorite),
          title: "Saúde",
        ),
        TabNavigationItem(
          page: HistoryListPage(),
          icon: Icon(Icons.history),
          title: "Histórico",
        ),
      ];
}
