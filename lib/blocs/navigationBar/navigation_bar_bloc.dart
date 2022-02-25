import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter_bloc/enums/enums.dart';
import 'package:meta/meta.dart';

part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<Tabs, NavigationBarState> {
  NavigationBarBloc() : super(HomeTabState());

@override
  Stream<NavigationBarState> mapEventToState(Tabs event) async* {
    switch (event) {
      case Tabs.Home:
        yield HomeTabState();
        break;
      default:
        yield ResultTabState();
        break;
    }
  }

}
