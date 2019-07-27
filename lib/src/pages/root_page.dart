import 'package:flutter/material.dart';
import 'package:navigation_bloc/src/pages/favorites_page.dart';
import 'package:navigation_bloc/src/pages/home_page.dart';
import 'package:navigation_bloc/src/pages/profile_page.dart';
import 'package:navigation_bloc/src/shared/blocs/bottom_navigation_bloc.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  BottomNavigationBloc _bottomNavigationBloc;

  @override
  void initState() {
    _bottomNavigationBloc = BottomNavigationBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bottomNavigationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation BLoC"),
      ),
      body: StreamBuilder<NavigationItem>(
          initialData: _bottomNavigationBloc.defaultItem,
          stream: _bottomNavigationBloc.getNavigation,
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case NavigationItem.HOME:
                return HomePage();
              case NavigationItem.FAVORITES:
                return FavoritesPage();
              case NavigationItem.PROFILE:
                return ProfilePage();
              default:
                return HomePage();
            }
          }),
      bottomNavigationBar: StreamBuilder<NavigationItem>(
          stream: _bottomNavigationBloc.getNavigation,
          initialData: _bottomNavigationBloc.defaultItem,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: snapshot.data.index,
              onTap: _bottomNavigationBloc.navigate,
              items: [
                BottomNavigationBarItem(
                  title: Text("HOME"),
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  title: Text("FAVORITES"),
                  icon: Icon(Icons.favorite),
                ),
                BottomNavigationBarItem(
                  title: Text("PROFILE"),
                  icon: Icon(Icons.person),
                ),
              ],
            );
          }),
    );
  }
}
