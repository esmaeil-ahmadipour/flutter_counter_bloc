import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(number: kIsWeb?((GetStorage().read("counter"))??0):0));


  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      int _tempNumber=state.number + 1;
     if(kIsWeb)GetStorage().write("counter",_tempNumber);
      yield CounterState(number: _tempNumber);
    } else if (event is DecrementEvent) {
      int _tempNumber=state.number - 1;
      if(kIsWeb) GetStorage().write("counter",_tempNumber);
      yield CounterState(number: _tempNumber);
    }

  }
}