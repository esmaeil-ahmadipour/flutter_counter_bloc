import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/blocs/navigationBar/navigation_bar_bloc.dart';
import 'package:flutter_counter_bloc/enums/enums.dart';
import 'package:flutter_counter_bloc/pages/first_page.dart';
import 'package:flutter_counter_bloc/pages/result_page.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  // late NavigationBarBloc _navbarBloc;

  @override
  void initState() {
    super.initState();
    // _navbarBloc = NavigationBarBloc();
  }

  @override
  void dispose() {
    // _navbarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final NavigationBarBloc navigationBarBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
        builder: (BuildContext context, NavigationBarState state) {
      return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<NavigationBarBloc, NavigationBarState>(
            builder: (BuildContext context, NavigationBarState state) {
              if (state is HomeTabState) {
                return Text(state.title);
              } else if (state is ResultTabState) {
                return Text(state.title);
              }
              return SizedBox();
            },
          ),
        ),
        body: BlocBuilder<NavigationBarBloc, NavigationBarState>(
          builder: (BuildContext context, NavigationBarState state) {
            if (state is HomeTabState) {
              return FirstPage();
            } else {
              return ResultPage();
            }
          },
        ),
        bottomNavigationBar:BottomNavigationBar(type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          currentIndex: (state is HomeTabState) ? 0 : 1,
          onTap: (index) {
            if (index == 0 && state is ResultTabState)
            {
              navigationBarBloc.add(Tabs.Home);
            }
            if (index == 1 && state is HomeTabState){
              navigationBarBloc.add(Tabs.Result);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: "Result",
            )
          ],
        ),
      );
    });
  }

// Scaffold buildHomepage(String title, int currentIndex) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(title),
//     ),
//     // body: currentIndex == 0 ? FirstPage() : ResultPage(),
//     bottomNavigationBar: BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: (index) {
//         if (index == 0) _navbarBloc.add(Tabs.Home);
//         if (index == 1) _navbarBloc.add(Tabs.Result);
//       },
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           title: Text("Home"),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.receipt),
//           title: Text("Result"),
//         )
//       ],
//     ),
//   );
// }
}
