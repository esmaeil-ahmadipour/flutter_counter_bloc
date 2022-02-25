part of 'navigation_bar_bloc.dart';

@immutable
abstract class NavigationBarState {}

class HomeTabState extends NavigationBarState {
  final String title = "Home";
  final int itemIndex = 0;
  final Color color = Colors.green;
}

class ResultTabState extends NavigationBarState {
   final String title = "Result";
   final int itemIndex = 1;
   final Color color = Colors.deepPurple;
}

