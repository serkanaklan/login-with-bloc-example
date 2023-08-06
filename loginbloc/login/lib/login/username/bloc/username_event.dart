part of 'username_bloc.dart';

@immutable
abstract class UsernameEvent extends Equatable {
  const UsernameEvent();
  @override
  List<Object> get props => [];
}

class AddUsername extends UsernameEvent {
  @override
  List<Object> get props => [];
}
