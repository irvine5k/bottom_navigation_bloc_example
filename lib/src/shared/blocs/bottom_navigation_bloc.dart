import 'package:rxdart/rxdart.dart';

enum NavigationItem { HOME, FAVORITES, PROFILE }

class BottomNavigationBloc {
  final defaultItem = NavigationItem.HOME;

  final _navigationController = BehaviorSubject<NavigationItem>();
  Observable<NavigationItem> get getNavigation => _navigationController.stream;

  navigate(int i) {
    switch (i) {
      case 1:
        _navigationController.add(NavigationItem.HOME);
        break;
      case 2:
        _navigationController.add(NavigationItem.FAVORITES);
        break;
      case 3:
        _navigationController.add(NavigationItem.PROFILE);
        break;
      default:
    }
  }

  dispose() {
    _navigationController?.close();
  }
}
