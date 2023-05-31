import 'package:http/http.dart';

enum AppEvent { increment, decrement }

abstract class ClientEvent {}

class LoadClieteEvent extends ClientEvent {}

class AddClieteEvent extends ClientEvent {
  Client client;

  AddClieteEvent({
    required this.client,
  });
}

class RemoveClieteEvent extends ClientEvent {
  Client client;

  RemoveClieteEvent({
    required this.client,
  });
}
