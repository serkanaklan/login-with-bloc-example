part of 'username_bloc.dart';

@immutable
abstract class UsernameState {}

class UsernameInitial extends UsernameState {}

class UsernameInitialized extends UsernameState {
  final String message;
  UsernameInitialized(this.message);
  @override
  List<Object> get props => [];
}

class UsernameError extends UsernameState {}
