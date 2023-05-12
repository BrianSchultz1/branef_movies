import 'dart:html';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum AppEvent { increment, decrement }

class AppBloc extends Bloc<Event, State> {
  AppBloc(super.initialState);
}
